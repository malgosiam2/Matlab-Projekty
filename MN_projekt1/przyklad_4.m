function [msc_zerowe, iteracja, blad_wzgledny, blad_bezwzgledny] = przyklad_4()
    % funkcja służy do pokazania działania programu dla wybranej funkcji.
    % Zwraca parametry: miejsce zerowe, liczba iteracji, blad względny i
    % bezwzględny, aby później móc zestawić i porównać te dane z innymi
    % przykładami
    
    %miejsce zerowe w srodku przedzialu
    disp('Przykład numer 4: ')
    alfa = [-1, 1, -1, 0, 1];
    a = 0;
    b = 2;
    eps = 10^(-10);
    [msc_zerowe, iteracja] = bisekcja(a, b, alfa, eps); 
    disp('Jedno miejsce zerowe, ilość iteracji: ')
    msc_zerowe
    iteracja
    % nie trzeba iterować, funckja spełnia założenia pierwszego if-a i pętla zostaje przerwana

    
    % próba znalezienia więcej miejsc zerowych
    miejsca = bisekcja2(a, b, alfa, eps, 6)
    disp('Wszystkie miejsca zerowe na danym przedziale: ')
    miejsca

    %błąd względny i bezwzględny:
    fun = @(x) wartosc_funkcji(alfa, x);
    dokladny = fzero(fun, [a, b]);
    blad_bezwzgledny = msc_zerowe - dokladny;
    blad_wzgledny = blad_bezwzgledny / dokladny;
    
    x = linspace(-1, 2, 200);
    figure;
    grid on;
    plot(x, wartosc_funkcji(alfa, x), 'LineWidth', 2);
    hold on;
    w = zeros(size(x));
    plot(x, w, '--');
    
    hold off;
    ylim([-2, 3])
    xlabel('Oś X');
    ylabel('f(x)');
    title('Wykres funkcji, dla której znajdujemy miejsce zerowe');
end