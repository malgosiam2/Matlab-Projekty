function [msc_zerowe, iteracja, blad_wzgledny, blad_bezwzgledny] = przyklad_6()
% funkcja służy do pokazania działania programu dla wybranej funkcji.
    % Zwraca parametry: miejsce zerowe, liczba iteracji, blad względny i
    % bezwzględny, aby później móc zestawić i porównać te dane z innymi
    % przykładami

%przykład 6: bardzo duzy wielomian czebyszewa, i bardzo duzo miejsc zerowych
    disp('Przykład numer 6: ')
    alfa = [-1, 2,-4, 0, 0, 3, -6, -6, 5, 2, 5, 0, -5, 2, 3, -4, -1, 0, 0, 5, 3, 4, -6, 7, -3, -1, 8, -3]
    a = 0.6;
    b = 10;
    x = linspace(-2, 2, 400);
    eps = 10^(-10);
    
    [msc_zerowe, iteracja] = bisekcja(a, b, alfa, eps);
    %miejsce zerowe:
    disp('Miejsce zerowe, iteracja: ')
    msc_zerowe %%% 1.4464
    %iteracje liczba:
    iteracja %%%    36
    
    %blad wzgledny i bezwzgledny:
    fun = @(x) wartosc_funkcji(alfa, x);
    dokladny = fzero(fun, [1.03, 2]); %przedzial, w ktorym jest miejsce zerowe wyznaczone powyzej
    blad_bezwzgledny = msc_zerowe - dokladny;
    blad_wzgledny = blad_bezwzgledny / dokladny;
    
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
    
    
    %najbardziej skomplikowany, czy sobie poradzi?
    
    miejsca = bisekcja2(a, b, alfa, eps, 2000); %7 miejsc zerowych
    bisekcja2(a, b, alfa, eps, 5000);  %9 miejsc zerowych
    bisekcja2(a, b, alfa, eps, 500);  %tylko pięć miejsc zerowych, nawet przy tak dużym k
end