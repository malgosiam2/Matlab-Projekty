function [L, D, LT] = wyznacz_rozklad_LDLT(A11, A12, A22)
%funkcja przyjmuje jako parametry podmacierze macierzy A z zadania.
%Następnie wyznacza rozkład macierzy A na postać L * D * LT, gdzie
%L -> macierz trójkątna dolna
%LT -> macierz transponowana L
%D -> macierz diagonalna postaci [I 0; 0 -I]

D = wyznacz_macierz_D(length(A11));
sprawdz_symetrycznosc_i_dodatnia_okreslonosc(A11)
L11 = rozklad_choleskiego_banachiewicza(A11);
L21 =  A12' * inv(L11');
sprawdz_symetrycznosc_i_dodatnia_okreslonosc(A22 + L21 * L21')
L22 = rozklad_choleskiego_banachiewicza(A22 + L21 * L21');

L = [L11 zeros(length(L11)); L21 L22];
LT = L';

end