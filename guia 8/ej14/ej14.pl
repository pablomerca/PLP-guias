% PARTE I

%desde(+X,-Y)
desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

% arma una lista de N elementos, tal que la suma de todos da S.
armarNupla(0, [], 0).
armarNupla(N, [X|Xs], S) :- N>0, 0 =< S, between(0, S, X), M is N-1, R is S-X, armarNupla(M, Xs, R).

% variacionesN(+N, +L, -V), V es la lista de variaciones de los elementos de L tomados de a N.
variacionesN(0, _, []).
variacionesN(N, L, [X|Xs]) :- N > 0, member(X, L), M is N - 1, variacionesN(M, L, Xs).

csm_con_suma(N, C, S) :- findall(T, armarNupla(N, T, S), Filas), variacionesN(N, Filas, C).

csm(N,C) :- desde(0,S), csm_con_suma(N,C,S).


% -------------------------------------------------------------------------------------------------------

% PARTE 2

iesimo(0, [L|_], L).
iesimo(I, [_|LS], X) :- I > 0, I2 is I - 1, iesimo(I2, LS, X).

get_column([], _, []).
get_column([R|M], I, [E|CC]) :- iesimo(I, R, E), get_column(M, I, CC).

check_cols_sum_aux(-1, _, _).
check_cols_sum_aux(I, Mat, S) :- 0 =< I, get_column(Mat, I, C), sum_list(C,S), Z is I-1, check_cols_sum_aux(Z, Mat, S).

check_cols_sum(Mat) :- get_column(Mat, 0, C), sum_list(C,S), length(Mat,N), I is N-1, check_cols_sum_aux(I,Mat,S).

cm(N, C) :- csm(N, C), check_cols_sum(C).

