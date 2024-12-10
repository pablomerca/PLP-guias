p(a).
p(b).
p(33).
p(c).


findallP(X) :- findallP_aux([], X).

findallP_aux(Acc, X) :- p(Elem), \+ member(Elem, Acc), findallP_aux([Elem|Acc], X).
findallP_aux(X, X) :- p(Elem), member(Elem, X), !.
findallP_aux(X, X).

