% last(?L, ?U) , donde U es el último elemento de la lista L.
last([X], X).
last([_|Xs], U) :- last(Xs, U).

% reverse(+L, ?R), donde R contiene los mismos elementos que L, pero en orden inverso.
reverse([], []).
reverse([X|Xs], Zs) :-  reverse(Xs, Ys), append(Ys, [X], Zs).
% ^^^ es importante que el append este despues del reverse, asi el Ys ya queda instanciado,
% si el append estuviese primero, tendria 2 variables no instanciadas (Ys , Zs) y habria problemas.


% prefijo(?P, +L), donde P es prefijo de la lista L.
prefijo(P, L) :- append(P, _, L). 

% sufijo(?S, +L), donde S es sufijo de la lista L.
sufijo(S,L) :- append(_, S, L).

% sublista(?S, +L), donde S es sublista de L.
sublista([], _).
sublista([S|Ss], L) :- prefijo(P, L), sufijo([S|Ss], P).
% la razon por la cual tratamos a la sub-lista vacia como caso particular al comienzo es para que
% en la regla de abajo, tratemos siempre con una sub-lista no vacia... de lo contrario, en la segunda regla,
% siempre podriamos elegir a [], como sufijo de cualquier P, por lo que si pidiesemos todas las 
% sublistas posibles, estariamos devolviendo repeticiones de [].


% pertenece(?X, +L), que es verdadero sii el elemento X se encuentra en la lista L. 
pertenece(X, [X|_]).
pertenece(X, [_|Ys]) :- pertenece(X, Ys).
% esto tiene el problema por ej: pertenece(3, [1,3,3,3]), va a devolver true 3 veces...