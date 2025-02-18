function [msc_zerowe, iteracja, blad_wzgledny, blad_bezwzgledny] = przyklad_1()
    % funkcja służy do pokazania działania programu dla wybranej funkcji.
    % Zwraca parametry: miejsce zerowe, liczba iteracji, blad względny i
    % bezwzględny, aby później móc zestawić i porównać te dane z innymi
    % przykładami


    % Przykład numer 1: Miejsca zerowe są blisko siebie
    %Uwaga! Często ropatruję przedział od 0 do b, b różne od zera i przeciwnego
    %znaku niż f(0). Wtedy każde miejsce zerowe, które wyznaczę, ponieważ
    %funkcja jest parzysta, jest po drugiej stronie osi X, 'z minusem'
    
    % -------- wybór funkcji, przedziału i obliczenie jednego miejsca zerowego
    % oraz liczby iteracji:
    disp('Przykład numer 1: ')
    alfa = [-4, 1, 1, 1, 1, 1, 1, 1];
    a = 0;
    b = 3;
    eps = 10^(-5);
    [msc_zerowe, iteracja] = bisekcja(a, b, alfa, eps);
    %miejsce zerowe:
    disp('Miejsce zerowe: ')
    msc_zerowe  %%% 0.0740
    %liczba iteracji:
    disp('liczba iteracji: ')
    iteracja %%%    18
    
    
    %błąd względny i bezwzględny, porównanie wyników:
    fun = @(x) wartosc_funkcji(alfa, x);
    dokladny = fzero(fun, [a, b]);
    blad_bezwzgledny = round(msc_zerowe - dokladny, 10);
    blad_wzgledny = blad_bezwzgledny / dokladny;
  
    % -------- wykres 
    x = linspace(-2, 2, 100);
    y = wartosc_funkcji(alfa, x);
    figure;
    grid on;
    plot(x, y, 'LineWidth', 2);
    hold on;
    w = zeros(size(x));
    plot(x, w, '--');
    hold off;
    ylim([-2, 3])
    xlabel('Oś X');
    ylabel('f(x)');
    title('Wykres funkcji, dla której znajdujemy miejsce zerowe');
    
    %Szukanie większej ilości miejsc zerowych na przedziale:
    
    bisekcja2(a, b, alfa, eps, 10); %jedno miejscewy
    wszystkie_miejsca_zerowe =bisekcja2(a, b, alfa, eps, 50) % wszystkie siedem miejsc zerowych
    bisekcja2(a, b, alfa, eps, 60); %pięć miejsc
    disp('Wszystkie miejsca zerowe dla przykładu numer 1: ')
    wszystkie_miejsca_zerowe
end