function [msc_zerowe, iteracja, blad_wzgledny, blad_bezwzgledny] = przyklad_5()
    % funkcja służy do pokazania działania programu dla wybranej funkcji.
    % Zwraca parametry: miejsce zerowe, liczba iteracji, blad względny i
    % bezwzględny, aby później móc zestawić i porównać te dane z innymi
    % przykładami
    
    %przykład 5: przyjmujemy dużą wartość eps:
    disp('Przykład numer 5: ')
    alfa = [-1, 1, -3, 0, 0, 0, 5];
    a = -1;
    b = 0.3;
    eps = 10^(-3);
    x = linspace(-1, 1, 100);
    [msc_zerowe, iteracja] = bisekcja(a, b, alfa, eps);
    disp('Miejsce zerowe, iteracje: ')
    msc_zerowe
    iteracja

    %iter   10
    %miejsce    -0.3557

    
    %blad bezwzgledny i wzgledny:
    fun = @(x) wartosc_funkcji(alfa, x);
    dokladny = fzero(fun, [a, b]);
    dokladny; %%%    -0.3562
    blad_bezwzgledny = msc_zerowe - dokladny;
    blad_wzgledny = blad_bezwzgledny / dokladny;

    %czy naprawdę wyznaczyliśmy miejsce zerowe?
    wartosc_funkcji(alfa, msc_zerowe) %jest to dosyć duży błąd
    
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
    
    wszystkie_miejsca = bisekcja2(a, b, alfa, eps, 50)  %możemy obliczyc wiecej miejsc, ale beda
    %bardzo niedokladne
end