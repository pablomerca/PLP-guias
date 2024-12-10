:- discontiguous nodos/2.
:- discontiguous aristas/2.

% Grafo vacio.
nodos(g0, []).
aristas(g0, []).

% Grafo trivial.
nodos(g1, [1]).
aristas(g1, []).

% Grafo simple.
nodos(g2, [1,2,3,4]).
aristas(g2, [(1,2), (2,3), (1,3), (3,4)]).

% Grafo con un ciclo.
nodos(g3, [1,2,3,4]).
aristas(g3, [(1,2), (2,3), (1,3), (3,4), (4,1)]).

% Grafo disconexo.
nodos(g4, [1,2,3,4]).
aristas(g4, [(1,2), (3,4)]).

% Grafo disconexo trivial.
nodos(g5, [1,2]).
aristas(g5, []).

% Grafo extrella.
nodos(g6, [1,2,3,4]).
aristas(g6, [(1,2), (1,3), (1,4)]).

esNodo(G, N) :- nodos(G, Ns), member(N, Ns).

esArista(G, N1, N2) :-
    esNodo(G, N1),
    esNodo(G, N2),
    aristas(G, As),
    member((N1, N2), As).

esArista(G, N1, N2) :-
    esNodo(G, N1),
    esNodo(G, N2),
    aristas(G, As),
    not(member((N1, N2), As)),
    member((N2, N1), As).



% ----------------------------------------------------------------------------------------







% esNodo(+G, ?X)

% esArista(+G, ?X, ?Y)


% caminoSimple(+G,+D,+H,?L) que dice si L es un camino simple en el grafo G que empieza en D y termina en H.
% de hecho, este predicado es reversible tambien en D y H, gracias a que esArista es reversible...
caminoSimple(G, D, H, L) :- caminoSimple_aux(G, D, H, [H], L).

caminoSimple_aux(G, D, D, Ac, Ac) :- esNodo(G,D).
caminoSimple_aux(G, D, H, Ac, L) :- esArista(G,H,X), not(member(X,Ac)), caminoSimple_aux(G, D, X, [X|Ac], L).
% la funcion auxiliar contruye el camino desde el final hasta el comienzo...
% ^^^ es reversible, ya que si instanciamos L, entonces la func aux va a armar el camino como siempre y en el ultimo paso 
% lo va a comparar con la L que vino instanciada.


% sabemos que el camino simple C es hamiltoniano cuando : member(G,X) <--> member(C,X), (<--) lo tenemos asegurado por como es caminoSimple() lo tenemos asegurado por como es caminoSimple().
% falta ver que: esNodo(G,X) --> member(C,X), eso pasa sii !esNodo(G,X) v member(C,X) sii !(esNodo(G,X) ^ !member(C,X)) 
% sii not(esNodo(G,X), not(member(C,X)))


% nodoFueraDeCamino(+G, +C, ?N)
nodoFueraDeCamino(G,C,N) :- esNodo(G,N), not(member(N,C)).

% caminoHamiltoniano(+G,?L) 
caminoHamiltoniano(G, C) :- caminoSimple(G, _, _, C), not(nodoFueraDeCamino(G,C,_)).

% D y H las dejo con _, no estan instanciadas, asi que van a tomar todos los posibles pares de nodos en el backtracking....
% solo que les pongo _, xq no me interesan sus valores finales.

% nodosDisconexos(+G, ?N, ?N)
nodosDisconexos(G,N1,N2) :- esNodo(G,N1), esNodo(G,N2), not(caminoSimple(G,N1,N2,_)).

esConexo(G) :- not(nodosDisconexos(G,_,_)).


% noHayArista(+G, +N, ?M)
noHayArista(G,N,M) :- esNodo(G,M), N \= M, not(esArista(G,N,M)).

% nodoCentroEstrella(+G, ?N)
nodoCentroEstrella(G,N) :- esNodo(G,N), not(noHayArista(G,N,_)).

% esEstrella(+G) , lo malo es que tiene soluciones repetidas, pero se arregla con un cut...
esEstrella(G) :- nodoCentroEstrella(G,_), !.



