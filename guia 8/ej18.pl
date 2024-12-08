% corteMásParejo(+L,-L1,-L2)

% L1, L2 = argmin{ |sum(I) - sum(D)| : append(I,D,L)}

corteMasParejo(L, L1, L2) :- append(L1, L2, L), val_corte(L1, L2, V), not(hayCorteMejor(L,V)).

hayCorteMejor(L,V) :- append(L1, L2, L), val_corte(L1, L2, V2), V2 < V.  

val_corte(L1, L2, V) :- sum_list(L1, N1), sum_list(L2, N2), V is abs(N1 - N2).