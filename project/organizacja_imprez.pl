% Fakty gosc/1
gosc('Jan Kowalski').
gosc('Anna Nowak').
gosc('Piotr Wiśniewski').
gosc('Maria Lewandowska').
gosc('Krzysztof Nowak').
gosc('Ewa Kowalczyk').
gosc('Tomasz Zieliński').
gosc('Agnieszka Wiśniewska').
gosc('Marek Kowalski').
gosc('Katarzyna Nowak').

% Fakty miejsce/3
miejsce('Restauracja', 50, 1000).
miejsce('Klub', 100, 2000).
miejsce('Sala Koncertowa', 200, 3000).

% Fakty catering/3
catering('Firma X', 'wegetarianski', 50).
catering('Firma Y', 'tradycyjny', 70).
catering('Firma Z', 'weganski', 60).

% Fakty muzyka/2
muzyka('DJ Fisher', 500).
muzyka('Solista 163ONMYNECK', 900).
muzyka('Zespol Twenty One Pilots', 1500).
muzyka('DJ Vasio', 700).
muzyka('Zespol The Weekend', 3000).


% Fakty impreza/2
:- dynamic impreza/2.
impreza('Impreza 1', ['Jan Kowalski', 'Anna Nowak', 'Piotr Wiśniewski']).
impreza('Impreza 2', ['Maria Lewandowska', 'Krzysztof Nowak', 'Ewa Kowalczyk']).
impreza('Kortowiada', ['Tomasz Zieliński', 'Agnieszka Wiśniewska', 'Marek Kowalski', 'Katarzyna Nowak']).


% Znajdowanie odpowiedniego miejsca na podstawie liczby gości
wybrac_miejsce(LiczbaGosci, Miejsce) :-
    miejsce(Miejsce, Pojemnosc, _),
    LiczbaGosci =< Pojemnosc.

% Obliczanie kosztów całkowitych imprezy
koszt_calosciowy(Miejsce, Catering, Muzyka, LiczbaGosci, Koszt) :-
    miejsce(Miejsce, _, CenaMiejsca),
    catering(Catering, _, CenaCateringuNaOsobe),
    muzyka(Muzyka, CenaMuzyki),
    Koszt is CenaMiejsca + (CenaCateringuNaOsobe * LiczbaGosci) + CenaMuzyki.

% Sprawdzanie, czy dany gosc jest zaproszony na dana impreze
jest_zaproszony(Gosc, Impreza) :-
    impreza(Impreza, ListaGosci),
    member(Gosc, ListaGosci).

% Dodawanie nowego gościa do listy gości imprezy
dodaj_goscia(Gosc, Impreza) :-
    impreza(Impreza, ListaGosci),
    \+ member(Gosc, ListaGosci),
    retract(impreza(Impreza, ListaGosci)),
    assertz(impreza(Impreza, [Gosc | ListaGosci])).

% Usuwanie gościa z listy gości imprezy
usun_goscia(Gosc, Impreza) :-
    impreza(Impreza, ListaGosci),
    member(Gosc, ListaGosci),
    delete(ListaGosci, Gosc, NowaListaGosci),
    retract(impreza(Impreza, ListaGosci)),
    assertz(impreza(Impreza, NowaListaGosci)).

% Otrzymanie informacji o imprezie
impreza_info(Impreza, ListaGosci, Miejsce, Catering, Muzyka, Koszt) :-
    impreza(Impreza, ListaGosci),
    length(ListaGosci, LiczbaGosci),
    wybrac_miejsce(LiczbaGosci, Miejsce),
    catering(Catering, _, _),
    muzyka(Muzyka, _),
    koszt_calosciowy(Miejsce, Catering, Muzyka, LiczbaGosci, Koszt).

