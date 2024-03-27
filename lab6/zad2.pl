% Rozpoznawanie wielomianów jednej zmiennej
% o wspólczynnikach liczbowych

/*
 Definicja rekurencyjna strukturalna

 1) x jest wielomianem zmiennej x
    c - liczba jest wielomianem dowolnej zmiennej

 2)Jezeli w, w1, w2 sa wielomianami zm. x, to
   -w, w1+w2, w1-w2, w1*w2,w^N (N - liczba naturalna)
   sa wielomianami zmiennej x
*/

% wielomian(W,X)
% spelniony, gdy w jest wielomianem zmiennej x
% o wspólczynnikach liczbowych
% definicja rekurencyjna

% warunki zakonczenia rekurecji
 wielomian(X,X).
 wielomian(C,_):-number(C).

% rekurencja
wielomian(-W,X):-wielomian(W,X).
wielomian(W1+W2,X):-wielomian(W1,X),

wielomian(W2,X).

wielomian(W1-W2,X):-wielomian(W1,X),

wielomian(W2,X).

wielomian(W1+W2,X):-wielomian(W1,X),

wielomian(W2,X).

wielomian(W^N,X):-integer(N),N>1,wielomian(W,X).








