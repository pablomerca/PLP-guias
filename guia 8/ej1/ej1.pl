padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).
abuelo(X, Y) :- padre(X, Z), padre(Z, Y).

ancestro(X, X).
ancestro(X, Y) :- ancestro(Z, Y), padre(X, Z).

% X es hijo de Y si Y es padre de X.
hijo(X, Y) :- padre(Y, X).

% X es hermano de Y si tienen el mismo padre.
hermano(X, Y) :- padre(Z, X), padre(Z, Y), X \= Y.

% X es descendiente de Y si:
% - X es el hijo directo de Y.
% - X es el hijo de algún descendiente de Y.
descendiente(X, Y) :- hijo(X, Y).
descendiente(X, Y) :- hijo(X, Z), descendiente(Z, Y).


