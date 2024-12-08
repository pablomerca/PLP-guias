% % desdeRev(+X, ?Y)
% desdeRev(X,X).
% desdeRev(X,Y) :- ground(Y), Y > X.
% desdeRev(X,Y) :- var(Y), N is X+1, desde(N,Y).

p(3).
p(243).
p(69).
p(543).
% p(X) :- 10 < X. % no funca con el not xq p no es reversible en este caso.

minSatP(X) :- p(X), not(hayMenorSatP(X)). % p debe ser reversible en X.
hayMenorSatP(X) :- p(Y), Y < X.