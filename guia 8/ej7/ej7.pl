% % intersección(+L1, +L2, -L3).
interseccion_mal([],_,[]).
interseccion_mal([X|Xs], Ys, [X|Zs]) :- member(X, Ys), interseccion_mal(Xs, Ys, Zs), not(member(X, Zs)).
interseccion_mal([X|Xs], Ys, Zs) :- not(member(X, Ys)), interseccion_mal(Xs, Ys, Zs).

% ^^^ esta version naive tiene un problema en la 2da regla, el not(member(X,Zs)) esta despues que se construye en Zs, entonces
% ese Zs puede tener repeticiones de X ya que todavia no llego a la condicion que lo exluye, entonces si pasamos listas con 
% valores repetidos, nunca van a poder pasar el not(member(X,Zs)), y no va a haber soluciones...

% Por otro lado, si ponemos el not(member(X,Zs)) antes de la llamada a interseccion(...), entonces no vamos a tener a Zs instanciado, ya que -L3...
% y ahi tenemos otro error, ya que no podemos usar el not()... si tan solo hubiese una forma de tener Zs instanciado...
% Podemos usar una variable acumuladora para ir creando L3 de forma iterativa a partir de una lista instanciada, asi podemos usar el not().



% interseccion con vacio es vacio.
interseccion_aux([], _, _, []).
% skipeamos X si no esta en Ys.
interseccion_aux([X | Xs], Ys, Ac, Zs) :-  not(member(X, Ys)), interseccion_aux(Xs, Ys, Ac, Zs). 
% skipeamos X si ya lo habiamos agregado (si esta en Ac), notar que si X no esta en Ac, falla, muere la rama (no hay soluciones rep).
interseccion_aux([X | Xs], Ys, Ac, Zs) :-  member(X, Ac), interseccion_aux(Xs, Ys, Ac, Zs).
% si X esta en Ys y ademas no lo habiamos agregado, entonces lo agregamos a Zs y agregamos X a Ac en la recursion.
interseccion_aux([X | Xs], Ys, Ac, [X | Zs]) :-  member(X, Ys), not(member(X, Ac)), interseccion_aux(Xs, Ys, [X | Ac], Zs). 

interseccion(Xs, Ys, Zs) :-  interseccion_aux(Xs, Ys, [], Zs).



% partir(N, L, L1, L2), donde L1 tiene los N primeros elementos de L, y L2 el resto.
partir(0, L, [], L).
partir(N, [X|Xs], [X|L1], L2) :- M is N-1, partir(M, Xs, L1, L2).


% borrar(+ListaOriginal, +X, -ListaSinXs), que elimina todas las ocurrencias de X de la lista ListaOriginal.
borrar([], _, []).
borrar([E|Xs], E, Ys) :- borrar(Xs, E, Ys).
borrar([X|Xs], E, [X|Ys]) :- X \= E, borrar(Xs, E, Ys).

% sacarDuplicados(+L1, -L2), que saca todos los elementos duplicados de la lista L1.
sacarDuplicados([],[]). 
sacarDuplicados([X|Xs], Ys) :- member(X,Xs), !,  sacarDuplicados(Xs, Ys).
sacarDuplicados([X|Xs], [X|Ys]) :- not(member(X,Xs)), sacarDuplicados(Xs, Ys).

% el ! es xq member(E, L) devuelve true tantas veces como aparezca E en L, asi que ahi vamos a tener varias ramas
% repetidas, para evitar eso, matamos las ramas del backtracking de member con un cut.


% instertar(?E, +L, ?Z) Z es L con E instertado en algun lado.
insertar(E, L, Z) :- append(Xs, Ys, L), append(Xs, [E], W), append(W, Ys, Z).

% permutación(+L1, ?L2), que tiene éxito cuando L2 es permutación de L1.
permutacion([], []).
permutacion([E|L1], L2) :- permutacion(L1, W), insertar(E, W, L2).


%  reparto(+L, +N, -LListas) que tenga éxito si LListas es una lista de N listas (N ≥ 1) de cualquier
% longitud - incluso vacías - tales que al concatenarlas se obtiene la lista L.
reparto([], 0, []).
reparto(L, N, [P|LListas]) :- N>0, append(P,Q,L), M is N-1, reparto(Q, M, LListas).


%repartoSinVacías(+L, -LListas) similar al anterior, pero ninguna de las listas de LListas puede ser
% vacía, y la longitud de LListas puede variar.
repartoSinVacías(L, LListas) :- length(L, N), between(1, N, M), reparto(L, M, LListas), not(member([], LListas)).

