function [D] = wyznacz_macierz_D(p)
%p -> rozmiar podmacierzy macierzy blokowej A 
%Funkcja ta wyznacza postać macierzy D. Z zadania wiadomo, że macierz ta
%jest diagonalna, z jedynkami lub minus jedynkami na przekątnej.

I = eye(p);
II = (-1) * I;
Z = zeros(p);
D = [I Z; Z II];

end