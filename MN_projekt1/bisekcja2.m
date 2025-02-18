function [msc_zerowe] = bisekcja2(a, b, alfa, eps, k)
%

msc_zerowe = [];

przedzialy = (0) * (k + 1);
przedzialy(1) = a;
przedzialy(k+1) = b;
for i=1:k-1
    przedzialy(i+1) = a + i*(b-a)/k;
end

for j=1:(length(przedzialy)-1)
    a = przedzialy(j);
    b = przedzialy(j + 1);
    przedzial = (b-a) / 2;
    if sign(wartosc_funkcji(alfa, a)) ~= sign(wartosc_funkcji(alfa, b))

        while przedzial > eps
            c = (a + b) / 2;
            if wartosc_funkcji(alfa, c) == 0
                break;
            end

            if sign(wartosc_funkcji(alfa, a)) ~= sign(wartosc_funkcji(alfa, c))
                b = c;
            else
                a = c;
            end

            przedzial = (b - a) / 2;

        end
        dodac = a + (b - a) / 2;
        msc_zerowe = [msc_zerowe, dodac];
  

    end
end
end