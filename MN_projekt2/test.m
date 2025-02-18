% skrypt testowy do projektu drugiego z metod numerycznych 

colnames = {'czas wyznaczania rozkładu choleskiego funkcją chol()', 'czas wyznaczania rozkładu choleskiego funkcją moją', 'różnica pomiędzy wynikiem z pierwszej i drugiej kolumny', 'czas wyznaczania x z układu równań metodą linsolve', 'czas wyznaczania x moją funckją', 'różnica pomiędzy czwartą i piątą kolumną'};
% przykład numer 1: standardowa macierz 

A11_jeden = [4 2; 2 8];
A22_jeden = [1 1; 1 10];
A12_jeden = [2 1; 3 1];
A_jeden = [A11_jeden A12_jeden; A12_jeden' -A22_jeden];
b_jeden = [2 1 0 2];

[L_jeden, D_jeden, Lt_jeden] = wyznacz_rozklad_LDLT(A11_jeden, A12_jeden, A22_jeden);
tic
x_prim_jeden = rozwiaz_uklad_rownan_liniowych(L_jeden, D_jeden, Lt_jeden, b_jeden);
fin_moje_jeden = toc;

%blad bezwzgledny rozkladu macierzy A
A_prim_jeden = L_jeden * D_jeden * Lt_jeden;
blad_rozkladu_jeden = A_jeden - A_prim_jeden;

%blad bezwzgledny rozwiązywania układu równań
tic
x_jeden = linsolve(A_jeden, b_jeden');
fin_matlab_jeden = toc;
blad_wyznaczania_x_jeden = x_jeden - x_prim_jeden;

%czas pomiedzy obliczeniem rownania roznymi sposobami
czas_wyznaczania_matlab_jeden = fin_matlab_jeden;
czas_wyznaczania_moje_jeden = fin_moje_jeden;
roznica_rownanie_jeden = fin_moje_jeden - fin_matlab_jeden;
%czas pomiedzy wyznaczeniem rozkladu dla bloku A11 roznymi sposobami
tic
chol_A11_matlab_jeden = chol(A11_jeden, "lower");
fin_chol_matlab_jeden = toc;

tic
chol_A11_moje_jeden = rozklad_choleskiego_banachiewicza(A11_jeden);
fin_chol_moje_jeden = toc;
roznica_chol_jeden = fin_chol_moje_jeden - fin_chol_matlab_jeden;

Tabela_1 = [fin_chol_matlab_jeden, fin_chol_moje_jeden, roznica_chol_jeden, czas_wyznaczania_matlab_jeden, czas_wyznaczania_moje_jeden, roznica_rownanie_jeden];
Tabela_1 = table(Tabela_1(:,1), Tabela_1(:, 2), Tabela_1(:, 3), Tabela_1(:, 4), Tabela_1(:, 5), Tabela_1(:, 6), 'VariableNames', colnames);
%przykład numer 2: macierz o bardzo dużym wymiarze

A11_dwa = [4 1 4 0 4 1 1 3 1;
    1 5 3 3 4 2 1 2 2;
    4 3 9 3 4 0 1 0 0;
    0 3 3 10 4 3 1 2 9;
    4 4 4 4 10 4 1 2 3;
    1 2 0 3 4 4 1 2 3;
    1 1 1 1 1 1 1 0 3;
    3 2 0 2 2 2 0 100 5;
    1 2 0 9 3 3 3 5 100];

A12_dwa = [3 7 2 1 0 0 2 3 4;
    1 4 5 2 3 4 5 6 7;
    9 0 0 0 1 2 3 0 1;
    0 3 1 4 3 5 4 2 5;
    2 5 2 5 24 0 4 1 3;
    0 0 0 0 1 3 0 4 4;
    3 5 4 4 8 8 8 0 2;
    7 8 9 0 2 2 0 1 1;
    1 1 1 1 1 1 1 1 0];

A22_dwa = [8 3 2 1 1 2 1 2 2;
    3 9 2 0 0 2 1 2 3;
    2 2 2 1 1 2 1 2 5;
    1 0 1 9 2 5 1 2 7;
    1 0 1 2 30 5 1 2 9;
    2 2 2 5 5 9 1 2 4;
    1 1 1 1 1 1 12 2 4;
    2 2 2 2 2 2 2 22 4;
    2 3 5 7 9 4 4 4 30];

b_dwa = [2 0 1 2 0 2 9 0 1 9 0 0 1 2 0 5 6 7];
A_dwa = [A11_dwa A12_dwa; A12_dwa' -A22_dwa];
[L_dwa D_dwa Lt_dwa] = wyznacz_rozklad_LDLT(A11_dwa, A12_dwa, A22_dwa);

tic
x_prim_dwa = rozwiaz_uklad_rownan_liniowych(L_dwa, D_dwa, Lt_dwa, b_dwa);
fin_moje_dwa = toc;

%blad bezwzgledny rozkladu macierzy A
A_prim_dwa = L_dwa * D_dwa * Lt_dwa;
blad_rozkladu_dwa = A_dwa - A_prim_dwa;

%blad bezwzgledny rozwiązywania układu równań
tic
x_dwa = linsolve(A_dwa, b_dwa');
fin_matlab_dwa = toc;
blad_wyznaczania_x_dwa = x_dwa - x_prim_dwa;

%czas pomiedzy obliczeniem rownania roznymi sposobami
czas_wyznaczania_matlab_dwa = fin_matlab_dwa;
czas_wyznaczania_moje_dwa = fin_moje_dwa;
roznica_rownanie_dwa = fin_moje_dwa - fin_matlab_dwa;

% czas pomiedzy wyznaczeniem rozkladu dla bloku A11 roznymi sposobami
tic
chol_A11_matlab_dwa = chol(A11_dwa, "lower");
fin_chol_matlab_dwa = toc;

tic
chol_A11_moje_dwa = rozklad_choleskiego_banachiewicza(A11_dwa);
fin_chol_moje_dwa = toc;
roznica_chol_dwa = fin_chol_moje_dwa - fin_chol_matlab_dwa;

Tabela_2 = [fin_chol_matlab_dwa, fin_chol_moje_dwa, roznica_chol_dwa, czas_wyznaczania_matlab_dwa, czas_wyznaczania_moje_dwa, roznica_rownanie_dwa];
Tabela_2 = table(Tabela_2(:,1), Tabela_2(:, 2), Tabela_2(:, 3), Tabela_2(:, 4), Tabela_2(:, 5), Tabela_2(:, 6), 'VariableNames', colnames);
% przykład numer 3: co jeśli macierz nie będzie spełniała warunku dodatniej określoności?
A11_trzy = [10 9; 9 2];
A22_trzy = [10 9; 9 2];
A12_trzy = [2 2; 2 2];
A_trzy = [A11_trzy A12_trzy; A12_trzy' -A22_trzy];
[L_trzy, D_trzy, Lt_trzy] = wyznacz_rozklad_LDLT_niepoprawnie(A11_trzy, A12_trzy, A22_trzy);

%blad bezwzgledny rozklad
A_prim_trzy = L_trzy * D_trzy * Lt_trzy;
blad_rozkladu_trzy = A_trzy - A_prim_trzy;

% przykład numer 4: elementy macierzy są bardzo małe lub bardzo duże
A11_cztery = [10000000 1234 0.0000000000000000009 66666666;
    1234 999999999999999 0.0000000000000000009 0.0000000890;
    0.0000000000000000009 0.0000000000000000009 234567890987654 0.0000000890;
    66666666 0.0000000890 0.0000000890 787878787878787878787878787];
A22_cztery = [90909090909090 90909090 0.00000000000000000000007 0.00000000023;
    90909090 90909090 0.00000000000000000000007 0.00000000000000000089;
    0.00000000000000000000007 0.00000000000000000000007 700000000000000000000 0.00000000000000000089;
    0.00000000023 0.00000000000000000089 0.00000000000000000089 4545400000000000000000];
A12_cztery = [0.00000003 0.000024 23467532 123253465434;
    0.0003242000032 12354 0.0000003 234567;
    132435467 12345 2345 76543;
    0.444444444444 0.000000004 0.2453 900000];
A_cztery = [A11_cztery A12_cztery; A12_cztery' -A22_cztery];
[L_cztery, D_cztery, Lt_cztery] = wyznacz_rozklad_LDLT(A11_cztery, A12_cztery, A22_cztery);
b_cztery = [12345 6789 2345 0.0000000033 0.232434 123456 7849 0.00000000009];

tic
x_prim_cztery = rozwiaz_uklad_rownan_liniowych(L_cztery, D_cztery, Lt_cztery, b_cztery);
fin_moje_cztery = toc;

%blad bezwzgledny rozkladu macierzy A
A_prim_cztery = L_cztery * D_cztery * Lt_cztery;
blad_rozkladu_cztery = A_cztery - A_prim_cztery;

%blad bezwzgledny rozwiązywania układu równań
tic
x_cztery = linsolve(A_cztery, b_cztery');
fin_matlab_cztery = toc;
blad_wyznaczania_x_cztery = x_cztery - x_prim_cztery;

%czas pomiedzy obliczeniem rownania roznymi sposobami
czas_wyznaczania_matlab_cztery = fin_matlab_cztery;
czas_wyznaczania_moje_cztery = fin_moje_cztery;
roznica_rownanie_cztery = fin_moje_cztery - fin_matlab_cztery;
%czas pomiedzy wyznaczeniem rozkladu dla bloku A11 roznymi sposobami
tic
chol_A11_matlab_cztery = chol(A11_cztery, "lower");
fin_chol_matlab_cztery = toc;

tic
chol_A11_moje_cztery = rozklad_choleskiego_banachiewicza(A11_cztery);
fin_chol_moje_cztery = toc;
roznica_chol_cztery = fin_chol_moje_cztery - fin_chol_matlab_cztery;

Tabela_4 = [fin_chol_matlab_cztery, fin_chol_moje_cztery, roznica_chol_cztery, czas_wyznaczania_matlab_cztery, czas_wyznaczania_moje_cztery, roznica_rownanie_cztery];
Tabela_4 = table(Tabela_4(:,1), Tabela_4(:, 2), Tabela_4(:, 3), Tabela_4(:, 4), Tabela_4(:, 5), Tabela_4(:, 6), 'VariableNames', colnames);

% przykład numer 5: macierz Hilberta w bloku A11 oraz A22

A11_piec = [1 1/2 1/3 1/4;
    1/2 1/3 1/4 1/5;
    1/3 1/4 1/5 1/6;
    1/4 1/5 1/6 1/7];
A22_piec = [1 1/2 1/3 1/4;
    1/2 1/3 1/4 1/5;
    1/3 1/4 1/5 1/6;
    1/4 1/5 1/6 1/7];
A12_piec = [1 2 3 4;
    5 6 7 8;
    9 10 11 12;
    13 14 15 16];
A_piec = [A11_piec A12_piec; A12_piec' -A22_piec];
[L_piec, D_piec, Lt_piec] = wyznacz_rozklad_LDLT(A11_piec, A12_piec, A22_piec);
b_piec = [1 2 3 4 5 6 7 8];

tic
x_prim_piec = rozwiaz_uklad_rownan_liniowych(L_piec, D_piec, Lt_piec, b_piec);
fin_moje_piec = toc;

%blad bezwzgledny rozkladu macierzy A
A_prim_piec = L_piec * D_piec * Lt_piec;
blad_rozkladu_piec = A_piec - A_prim_piec;

%blad bezwzgledny rozwiązywania układu równań
tic
x_piec = linsolve(A_piec, b_piec');
fin_matlab_piec = toc;
blad_wyznaczania_x_piec = x_piec - x_prim_piec;

%czas pomiedzy obliczeniem rownania roznymi sposobami
czas_wyznaczania_matlab_piec = fin_matlab_piec;
czas_wyznaczania_moje_piec = fin_moje_piec;
roznica_rownanie_piec = fin_moje_piec - fin_matlab_piec;
%czas pomiedzy wyznaczeniem rozkladu dla bloku A11 roznymi sposobami
tic
chol_A11_matlab_piec = chol(A11_piec, "lower");
fin_chol_matlab_piec = toc;

tic
chol_A11_moje_piec = rozklad_choleskiego_banachiewicza(A11_piec);
fin_chol_moje_piec = toc;
roznica_chol_piec = fin_chol_moje_piec - fin_chol_matlab_piec;

Tabela_5 = [fin_chol_matlab_piec, fin_chol_moje_piec, roznica_chol_piec, czas_wyznaczania_matlab_piec, czas_wyznaczania_moje_piec, roznica_rownanie_piec];
Tabela_5 = table(Tabela_5(:,1), Tabela_5(:, 2), Tabela_5(:, 3), Tabela_5(:, 4), Tabela_5(:, 5), Tabela_5(:, 6), 'VariableNames', colnames);


% przykład numer 6: macierz Toeplitza w blokach A11, A22
A11_szesc = [8 1 2; 1 8 1; 2 1 8];
A12_szesc = [1 1 0; 2 1 1; 1 2 1];
A22_szesc = [8 -1 -2; -1 8 -1; -2 -1 8];
A_szesc = [A11_szesc A12_szesc; A12_szesc' -A22_szesc];
[L_szesc D_szesc Lt_szesc] = wyznacz_rozklad_LDLT(A11_szesc, A12_szesc, A22_szesc);
b_szesc = [3 4 1 3 5 3];

tic
x_prim_szesc = rozwiaz_uklad_rownan_liniowych(L_szesc, D_szesc, Lt_szesc, b_szesc);
fin_moje_szesc = toc;

%blad bezwzgledny rozkladu macierzy A
A_prim_szesc = L_szesc * D_szesc * Lt_szesc;
blad_rozkladu_szesc = A_szesc - A_prim_szesc;

%blad bezwzgledny rozwiązywania układu równań
tic
x_szesc = linsolve(A_szesc, b_szesc');
fin_matlab_szesc = toc;
blad_wyznaczania_x_szesc = x_szesc - x_prim_szesc;

%czas pomiedzy obliczeniem rownania roznymi sposobami
czas_wyznaczania_matlab_szesc = fin_matlab_szesc;
czas_wyznaczania_moje_szesc = fin_moje_szesc;
roznica_rownanie_szesc = fin_moje_szesc - fin_matlab_szesc;
%czas pomiedzy wyznaczeniem rozkladu dla bloku A11 roznymi sposobami
tic
chol_A11_matlab_szesc = chol(A11_szesc, "lower");
fin_chol_matlab_szesc = toc;

tic
chol_A11_moje_szesc = rozklad_choleskiego_banachiewicza(A11_szesc);
fin_chol_moje_szesc = toc;
roznica_chol_szesc = fin_chol_moje_szesc - fin_chol_matlab_szesc;

Tabela_6 = [fin_chol_matlab_szesc, fin_chol_moje_szesc, roznica_chol_szesc, czas_wyznaczania_matlab_szesc, czas_wyznaczania_moje_szesc, roznica_rownanie_szesc];
Tabela_6 = table(Tabela_6(:,1), Tabela_6(:, 2), Tabela_6(:, 3), Tabela_6(:, 4), Tabela_6(:, 5), Tabela_6(:, 6), 'VariableNames', colnames);
