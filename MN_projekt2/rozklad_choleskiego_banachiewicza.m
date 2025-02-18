function [L] = rozklad_choleskiego_banachiewicza(A)
%A -> macierz, której rozkładu będziemy szukać, A = L * LT
%L -> macierz trójkątna dolna
%Funkcja służy do znalezienia rozkładu Choleskiego - Banachiewicza dla
%macierzy A. Macierz A musi być symetryczna i dodatnio określona.

%sprawdz_symetrycznosc_i_dodatnia_okreslonosc(A)

L = zeros(length(A));

for k = 1:length(A)
    L(k,k) = sqrt(A(k, k) - sum(L(k, 1:k-1).^2));
    i = k+1:length(A);
    L(i, k) = (A(i,k) - L(i, 1:k-1) * L(k, 1:k-1)') / L(k,k);

    L(i, k) = L(i, k);
end

end