function [msc_zerowe, iteracja, blad_wzgledny, blad_bezwzgledny] = przyklad_2()
    % funkcja służy do pokazania działania programu dla wybranej funkcji.
    % Zwraca parametry: miejsce zerowe, liczba iteracji, blad względny i
    % bezwzględny, aby później móc zestawić i porównać te dane z innymi
    % przykładami

    % przykład 2: miejsca zerowe blisko i duży przedział (dla wielomianu dużego
    % stopnia)
    % trudno jest wyznaczyć wszystkie miejsca zerowe, potrzeba bardzo dużego k,
    % a i tak nie ma pewnosci, ze to są wszystkie
    
    %wyznaczamy na dużym przedziale miejsce zerowe
    alfa = [-2,0,0,0,0,0,0,0, 0, 0, 0 ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3];
    a = 0;
    b = 20;
    eps = 10^(-10);
    disp('Przykład numer 2: ')
    [msc_zerowe, iteracja] = bisekcja(a, b, alfa, eps) ;
    disp('Miejsce zerowe, iteracja: ')
    msc_zerowe %%%%     0.7700
    iteracja %%%    37
    
    %blad wzgledny i bezwzgledny
    fun = @(x) wartosc_funkcji(alfa, x);
    dokladny = fzero(fun, [0.75, 0.79]); %przedzial, w ktorym jest miejsce zerowe wyznaczone powyzej
    blad_bezwzgledny = msc_zerowe - dokladny;
    blad_wzgledny = blad_bezwzgledny / dokladny;
    
    %wykres
    x = linspace(-2, 2, 200);
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
    
    %spróbujmy znaleźć więcej miejsc
    bisekcja2(a, b, alfa, eps, 40);  %wyznacza tylko jedno miejsce, nawet dla tak dużego k!!!
    bisekcja2(a, b, alfa, eps, 10000); % 33 miejsca zerowe, trochę za dużo 
    disp('15 miejsc zerowych na danym przedziale: jest ich tak dużo, że nie ma pewności, że są to wszystkie miejsca zerowe')
    bisekcja2(a, b, alfa, eps, 400) % 15 miejsc zerowych
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    









end