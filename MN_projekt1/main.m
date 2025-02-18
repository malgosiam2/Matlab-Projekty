%tworzenie tabelki podsumowującej

[msc_zerowe1, iteracja1, blad_wzgledny1, blad_bezwzgledny1] = przyklad_1();
[msc_zerowe2, iteracja2, blad_wzgledny2, blad_bezwzgledny2] = przyklad_2();
[msc_zerowe3, iteracja3, blad_wzgledny3, blad_bezwzgledny3] = przyklad_3();
[msc_zerowe4, iteracja4, blad_wzgledny4, blad_bezwzgledny4] = przyklad_4();
[msc_zerowe5, iteracja5, blad_wzgledny5, blad_bezwzgledny5] = przyklad_5();
[msc_zerowe6, iteracja6, blad_wzgledny6, blad_bezwzgledny6] = przyklad_6();

W = zeros(6, 4);
W(1, :) = [msc_zerowe1, iteracja1, blad_wzgledny1, blad_bezwzgledny1];
W(2, :) = [msc_zerowe2, iteracja2, blad_wzgledny2, blad_bezwzgledny2];
W(3, :) = [msc_zerowe3, iteracja3, blad_wzgledny3, blad_bezwzgledny3];
W(4, :) = [msc_zerowe4, iteracja4, blad_wzgledny4, blad_bezwzgledny4];
W(5, :) = [msc_zerowe5, iteracja5, blad_wzgledny5, blad_bezwzgledny5];
W(6, :) = [msc_zerowe6, iteracja6, blad_wzgledny6, blad_bezwzgledny6];


%   W tabelce, jeśli jakiś parametr nie został wyznaczony, bo na przykład
%   nie ma mieisca zerowego, to w komórce jest liczba 333
colnames = {'miejsce zerowe', 'ilość iteracji', 'bląd względny', 'bląd bezwzgędny'}
rownames = {'Przykład 1', 'Przykład 2', 'Przykład 3', 'Przykład 4', 'Przykład 5', 'Przykład 6'};

W = table(W(:,1), W(:,2), W(:,3), W(:,4), 'VariableNames', colnames, 'RowNames', rownames);
W
