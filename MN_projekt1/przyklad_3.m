function [msc_zerowe, iteracja, blad_wzgledny, blad_bezwzgledny] = przyklad_3()

    % funkcja służy do pokazania działania programu dla wybranej funkcji.
    % Zwraca parametry: miejsce zerowe, liczba iteracji, blad względny i
    % bezwzględny, aby później móc zestawić i porównać te dane z innymi
    % przykładami
    % przykład 3 - nie da się obliczyć miejsca zerowego -> pokazanie
    % ograniczenia tej metody
    a = -2;
    b = 2;
    % dwie funkcje: alfa dodatnie i nieujemne
    eps = 10^(-10);
    alfa1 = [4,4,2,5,1,3,5];
    disp('Przyklad numer 3:')
    disp('Miejsce zerowe: ')
    bisekcja(a, b, alfa1, eps) %funkcja nie posiada miejsc zerowych, jest dodatnia
    
    x = linspace(-1, 1, 200);
    alfa2 = [0, 0, 0, -1, 0, -1]; %funkcja posiada miejsce zerowe, ale nigdy nie zostanie wyznaczone
    y2 = wartosc_funkcji(alfa2, x);
    bisekcja(a, b, alfa2, eps);
    figure;
    grid on;
    plot(x, y2, 'LineWidth', 2);
    hold on;
    w = zeros(size(x));
    plot(x, w, '--');
    
    hold off;
    ylim([-2, 3])
    xlabel('Oś X');
    ylabel('f(x)');
    title('Wykres funkcji, dla której znajdujemy miejsce zerowe');

    %brak tych parametrów
    msc_zerowe = 333;
    iteracja = 333;
    blad_wzgledny = 333;
    blad_bezwzgledny = 333;

end