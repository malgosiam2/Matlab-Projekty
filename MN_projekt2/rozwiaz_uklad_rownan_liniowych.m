function [x] = rozwiaz_uklad_rownan_liniowych(L, D, LT, b)
%funkcja jako parametry przyjmuje rozłożoną na postac blokową macierz A
%oraz wektor wyrazów wolnych b. Funkcja służy do rozwiązania układu równań
%liniowych postaci Ax = b, czyli L * D * LT * x = b.

%Korzystając z własności, że macierze L i Lt są trójkątne oraz macierz D
%jest diagonalna, możemy wyznaczyć wektor x w nastepujący sposób:
% 1) -> wyznaczamy wektor z z równania L * z = b
% 2) -> wyznaczamy wektor y z równania D * y = z
% 3) -> wyznaczamy wektor x z równania LT * x = b

n = length(b);
if n ~= length(L)
    error('wektor b ma złe wymiary!')
end

z = zeros(n, 1);

for i=1:n
    wiersz = L(i, 1:i-1);
    k = z(1:i-1)';
    z(i) = (b(i) - sum(wiersz.*k)) / L(i, i);
    
end

y1 = z(1: length(z) / 2);
y2 = (-1) * z(length(z) / 2 + 1: length(z));
y = [y1; y2];

x = zeros(n, 1);
for i=n:-1:1
    wiersz = LT(i, i+1:n);
    k = x(i+1:n)';
    x(i) = (y(i) - sum(wiersz.*k)) / LT(i, i);
    
end

end