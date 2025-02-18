function [msc_zerowe, iter] = bisekcja(a, b, alfa, eps)
%funkcja służy do znalezienia (jednego) miejsca zerowego na danym przedziale za
%pomocą metody bisekcji
if a > b
    c = b;
    b = a;
    a = c;
end
if sign(wartosc_funkcji(alfa, a)) == sign(wartosc_funkcji(alfa, b))
    disp(" zly przedzial!!! ")
    msc_zerowe = 333;
    iter = 333;
else
    iter = 0;
    przedzial = (b - a) / 2;

    while przedzial > eps
        c = a + (b - a) / 2;
        if wartosc_funkcji(alfa, c) == 0
            break;
        end
        iter = iter + 1;
        if sign(wartosc_funkcji(alfa, a)) ~= sign(wartosc_funkcji(alfa, c))
            b = c;
        else
            a = c;
        end

        przedzial = (b - a) / 2;
       

    end
    msc_zerowe = a + (b - a) / 2;
end

end
