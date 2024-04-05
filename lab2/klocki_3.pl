/* definiujemy relacje nad(X,Y), speniona, gdy klocek X lezy nad klockiem Y
 *  (niekoniecznie bezposrednio) */

na(d,c).
na(c,a).
na(c,b).
na(a,e).
na(b,g).
nad(X,Y):-na(X,Y).
nad(X,Y):-na(X,Z),nad(Z,Y).

/*Czy klocek d lezy nad b?
 * ?-nad(d,b).
 * true,
 * false.*/

