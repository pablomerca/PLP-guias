
p(a).
p(b).
q(a) :- fail.

multipleP(X)
    :- p(X), p(Y), X \= Y.
uniqueP(X)
    :- not(multipleP(X)).

multipleQ(X)
    :- q(X), q(Y), X \= Y.
uniqueQ(X)
    :- not(multipleQ(X)), X is -1.




% = ?- p(X), not(q(X)).
% X = b.

% esta query ^^^ funciona normal como toda la vida, X le llega instanciada al not(...), checkeo izi.



% ?- not(q(X)), p(X).
% false.

% ^^^ en esta query, llega X no instanciada al not(...), eso es peligroso, el not(), va a tratar de
% satisfacer q(X) con alguna X, como tenemos q(a), con X=a funca... xlt falla el not()... muere ahi la rama,
% solo podemos llegar al not, no hay ningun valor de X tal que q(X), pero esto no pasa... ya que q(a).
% xlt nunca vamos a llegar al p(X).

