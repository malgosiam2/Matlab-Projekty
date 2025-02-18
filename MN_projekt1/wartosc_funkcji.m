function [y] = wartosc_funkcji(alfa, x)
% funckja służy do obliczenia wartości wielomianu podanego w zadaniu dla
% wektora x oraz współczynników alfa = [a0, a1, ..., an]. Posługujemy się
% pomocniczą funkcją czebyszew()

%funkcja zwraca wektor y z wartościami funkcji dla kolejnych x-ów

wielomian = czebyszew(x, length(alfa));

A = repmat(alfa, length(x), 1);

y = A .* wielomian;

y = sum(y, 2);


end