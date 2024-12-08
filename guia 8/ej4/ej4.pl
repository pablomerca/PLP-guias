% juntar(?L1, ?L2, ?L3)
juntar([], Y, Y).
juntar([X|XS], Y, [X|Z]) :- juntar(XS, Y, Z).


