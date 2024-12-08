% nil, si es vacío
% bin(izq, v, der), donde v es el valor del nodo, izq es el subárbol izquierdo y der es el subárbol derecho

% vacio(+AB)
vacio(nil).

% raiz(+AB)
raiz(ab(_,R,_), R).

% altura(+AB, ?H).
altura(nil, 0).
altura(bin(I,_,D), H) :- altura(I, H1), altura(D, H2), H is max(H1,H2)+1.


% cantNodos(+AB, -N)
cantNodos(nil,0).
cantNodos(bin(I,_,D), N) :- cantNodos(I, N1), cantNodos(D, N2), N is N1+N2+1.
