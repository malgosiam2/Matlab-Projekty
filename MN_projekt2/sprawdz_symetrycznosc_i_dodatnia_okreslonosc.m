function [] = sprawdz_symetrycznosc_i_dodatnia_okreslonosc(A)
%funkcja sprawdza, czy macierz A jest symetryczna jest dodatnio okreslona.
%Najpierw sprawdzimy symetrycznosc. Wtedy przy sprawdzaniu określoności
%bedziemy mogli skorzystać z kryterium Sylvestera.

%sprawdzenie symetryczności:
if A' ~= A
    error('Macierz nie jest symetryczna')
end


%sprawdzenie dodatniej określoności:
for i=1:length(A)
    if det(A(1:i, 1:i)) <= 0
        error('Macierz nie jest dodatnio określona')
    end
end


end