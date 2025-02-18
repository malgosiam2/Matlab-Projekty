function [y] = czebyszew(x, n)

%argumentami funkcji są x, dla których będziemy obliczać wartości kolejnych
%wielomianów Czebyszewa oraz maksymalny stopień wielomianu Czebyszewa

%outputem funkcji jest wektor y, w którym dla kolejnych x-ów podane są
%wartości bezwględne wartości wielomianów Czebyszewa w tym punkcie

y = zeros(length(x), n);

y(:, 1) = 1;
y(:, 2) = x;

for i = 3:n
    y(:, i) = 2 .* y(:, 2) .* y(:, i-1) - y(:, i-2);
end

y = abs(y);

end