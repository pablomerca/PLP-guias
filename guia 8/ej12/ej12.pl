% inorder(+AB,-Lista)
inorder(nil, []).
inorder(bin(I,R,D), Lista) :- inorder(I, LI), inorder(D, LD), append(LI,[R],W), append(W, LD, Lista).

% arbolConInorder(+Lista,-AB)
arbolConInorder([], nil).
arbolConInorder([H|T], bin(I,R,D)) :- append(LI, [R|LD], [H|T]), arbolConInorder(LI, I), arbolConInorder(LD, D).

%  aBB(+T), que será verdadero si T es un árbol binario de búsqueda.

aBB(nil).
aBB(bin(I,R,D)) :- aBB(I), aBB(D), inorder(I, LI), max_list([R|LI], R), inorder(, LD), min_list([R|LD], R), 

% aBBInsertar(+X, +T1, -T2), donde T2 resulta de insertar X en orden en el árbol T1.
aBBInsertar(X, nil, bin(nil, X, nil)).
aBBInsertar(X, bin(I,X,D), bin(I,X,D)).
aBBInsertar(X, bin(I,R,D), bin(I,R,T)) :- X > R, aBBInsertar(X, D, T). % obtengo la rama derecha por "recursion"
aBBInsertar(X, bin(I,R,D), bin(T,R,D)) :- X < R, aBBInsertar(X, I, T). % obtengo la rama izquierda por "recursion"