kobieta(ala).
kobieta(kasia).
kobieta(ola).

mezczyzna(piotr).
mezczyzna(adam).

madry(ala).
madry(kasia).
madry(kasia).

bogaty(ala).
bogaty(ola).

piekny(ola).
piekny(kasia).

szczesliwy(X):-bogaty(X).
lubi(X,Y):-mezczyzna(X),kobieta(Y),piekny(Y).

lox(a).

nielox(b):-lox(b).


