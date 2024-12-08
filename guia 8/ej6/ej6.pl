% % aplanar(+Xs, -Ys)
aplanar2([], []).
aplanar2([X|Xs], Ys) :- aplanar2(X, W1), aplanar2(Xs, W2), append(W1, W2, Ys).
aplanar2(X, [X]) :- X \= [], X \= [_|_].  % X no es una lista.



