:- discontiguous nodos/2.
:- discontiguous aristas/2.

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
caminoSimple(G, D, H, L) :- caminoSimple_aux(G, D, H, [H], L).

caminoSimple_aux(G, D, D, Ac, Ac) :- esNodo(G,D).
caminoSimple_aux(G, D, H, Ac, L) :- esArista(G,H,X), not(member(X,Ac)), caminoSimple_aux(G, D, X, [X|Ac], L).

% la funcion auxiliar contruye el camino desde el final hasta el comienzo...
% ^^^ es reversible, ya que si instanciamos L, entonces la func aux va a armar el camino como siempre y en el ultimo paso 
% lo va a comparar con la L que vino instanciada.





