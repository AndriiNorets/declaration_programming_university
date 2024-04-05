%PROGRAM: klocki_2
%baza wiedzy o ukladzie klocków
%Definiowane predykaty:
%na/2
%   pod/2
%  miedzy/3
%==============================================


%na(X,Y)
%opis:speniony,gdy klocek X lezy
%bezposrednio na klocku Y
% pod(X,Y)
%opis: speniony gdy klocek X lezy
%bezposrednio pod klockiem Y
%miedzy(X,Y,Z)
%opis:speniony, gdy klocek X lezy miedzy
%klockami Y i Z
%--------------------------------------na/2
 na(c,a).
 na(c,b).
 na(d,c).
      pod(X,Y):-na(Z,X),na(X,Y).
    miedzy(X,Y,Z):-na(Z,X),na(X,Y).
    miedzy(X,Y,Z):-na(Y,X),na(X,Z).
%--------------------------------------na/2

/*
 *Informacje o budowie programu:
 *Program skada sie z 6 klauzul.
 *Progra, zawiera 3 definicje relacji.
 *Sa to relacje na/2, pod/2 i miedzy/3.
 *Definicja relacji pod/2 sklada sie z 1
 *klauzuli, któea jest regula.
 *Definicja re;acji miedzy/3 sklada sie
 *z 2 klauzul, które sa regulami.
 */

