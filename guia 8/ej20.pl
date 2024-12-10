% proximoNumPoderoso(+X, -Y).
/*
proximoNumPoderoso(X, Y) :- X1 is X+1, desde2(X1, Y), between(2, Y, P1), esPrimo(P1),
                            0 is Y mod P1,
                            P2 is P1*P1, 0 is Y mod P2,
                            not((proximoNumPoderoso(X, Y1), Y1 < Y)).

El problema con esta solución es que estamos usando un generador infinito para un problema que tiene que generar una solucion
finita.
*/ 

proximoNumPoderoso(X, Y) :- Y is X+1, numPoderoso(Y).
proximoNumPoderoso(X, Y) :- N is X+1, not(numPoderoso(N)), proximoNumPoderoso(N, Y).
% Cuando encuentre el número poderoso, backtrackea y entra en el segundo, como es número poderoso, falla y nos quedamos
% con el true que nos dio el primer predicado.

% numPoderoso(X) :- between(2, X, Y), esPrimo(Y), 0 is X mod Y, Z is Y*Y, 0 is X mod Z.

numPoderoso(X) :- not(contraej(X,C)).
contraej(M,D) :- between(2,M,D), esPrimo(D), 0 is M mod D, D2 is D*D, not(0 is M mod D2).


% esPrimo(?X)
esPrimo(X) :- var(X), desde2(1, X), esPrimo(X).
esPrimo(X) :- nonvar(X), X \= 1, not((X1 is X-1, between(2, X1, N), 0 is X mod N)).

% no se uso, pero lo arregle.
% proximoPrimo(+X, -Y)
%proximoPrimo(X, Y) :- desde2(X, Y), Y \= X, esPrimo(Y), !.
proximoPrimo(X, X) :- esPrimo(X).
proximoPrimo(X, Z) :- not(esPrimo(X)), Y is X+1, not(esPrimo(Y)), proximoPrimo(Y, Z). 
proximoPrimo(X, Y) :- not(esPrimo(X)), Y is X+1, esPrimo(Y).


desde2(X, X).
desde2(X, Y) :- var(Y), N is X+1, desde2(N, Y).
desde2(X, Y) :- nonvar(Y), X < Y. 