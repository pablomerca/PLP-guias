%desde(+X,-Y)
desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

alturasHijos(N,M,HD) :- M is N-1, between(0,M,HD). 
alturasHijos(N,HI,M) :- M is N-1, M1 is M-1, between(0,M1,HI). 

arbolDeAltura(nil,0).
arbolDeAltura(bin(I,_,D),N) :- 
    N>0,
    alturasHijos(N,HI,HD),
    arbolDeAltura(I,HI), 
    arbolDeAltura(D,HD).

% arbol(-A), sirve solo para generar arboles, pero si le pasamos un A instanciado se rompe... no es reversible
arbol(A) :- desde(0,N), arbolDeAltura(A,N).


% ----------------------------------------------------------------------------------------

% checkArbol(+A,+L) , ojo A esta instanciado en estructura pero no en valores de nodos... en ese caso los instancia
checkArbol(nil,_).
checkArbol(bin(I,R,D),L) :- member(R,L), checkArbol(I,L), checkArbol(D,L).

% arbolDeAltura2(-A,+N,+L) 
arbolDeAltura2(nil,0,_).
arbolDeAltura2(bin(I,R,D),N,L) :- 
    N>0,
    member(L,R),
    alturasHijos(N,HI,HD),
    arbolDeAltura2(I,HI,L), 
    arbolDeAltura2(D,HD,L).


% nodosEn(?A, +L)
nodosEn(A, L) :- nonvar(A), checkArbol(A,L).
nodosEn(A, L) :- var(A), desde(0,N), arbolDeAltura2(A,N,L).


% ---------------------------------------------------------------------------------------

% cantNodos(+AB, -N)
cantNodos(nil,0).
cantNodos(bin(I,_,D), N) :- cantNodos(I, N1), cantNodos(D, N2), N is N1+N2+1.

% arbolSinRepes(+A,+L)
arbolSinRepes(nil, _). 
arbolSinRepes(bin(I,R,D), L) :- 
    L \= [], 
    member(R,L), 
    delete(L,R,L2), 
    particion(I,D,L2,LI,LD),
    arbolSinRepes(I,LI), 
    arbolSinRepes(D,LD).


% particion(+I,+D,+L,-LI,-LD), reparte los nodos de L en LI y LD para que sea asignados JUSTO a I a D.
% falla si I y D no son ambos nil y la cantidad de espacios que tienen en total no es length(L).
particion(nil,nil,_,[],[]).
particion(I,D,L,LI,LD) :- 
    cantNodos(I,NI), cantNodos(D,ND), 
    not(0 is NI+ND),
    length(LI,NI),
    length(LD,ND),
    append(LI,LD,L).


% sinRepEn(-A, +L)
sinRepEn(A, L) :- length(L,N), between(0,N,H), arbolDeAltura(A,H), arbolSinRepes(A,L).

% ^^^ cuando ya no quedan "espacios" por repartir, solo el primer llamado recursivo debe tener exito, el resto no,
% de esto se encarga particion.