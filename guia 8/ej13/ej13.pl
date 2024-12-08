%desde(+X,-Y)
desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

%coprimos(-X,-Y)
coprimos(X,Y) :- armarPares(X,Y), gcd(X,Y) =:= 1.

%armarPares(-X,-Y)
armarPares(X,Y) :- desde(1,S), between(0,S,X), Y is S-X. % X + Y = S.



% -----------------------------------------------------------------

% devuelve todas las posibles sub-listas (elems en orden orginal) de L de long N.
sublistN(0, _, []).
sublistN(N, [X|L], [X|R]) :- N>0, M is N-1, sublistN(M, L, R).
sublistN(N, [_|L], R) :- N>0, sublistN(N, L, R).



