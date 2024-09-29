## iii.

```haskell    
Eq a =>  ∀ xs::[a] . ∀ ys::[a] . ∀ e::a . elem e (union xs ys) = (elem e xs) || (elem e ys)
```

Esto es verdad, lo probamos con induccion estrucutrual sobre listas.


### Caso Base
```haskell  
-- quiero ver que:
elem e (union [] ys) = (elem e []) || (elem e ys)

elem e (union [] ys) 
= elem e (nub ([] ++ ys))       (U0)
= elem e (nub ys)               {++}
= elem e ys                     {ej6 ii}
= false || elem e ys
= (elem e []) || elem e ys
```

### Paso inductivo
```haskell   
-- HI :
elem e (union xs ys) = (elem e xs) || (elem e ys)

-- quiero ver que:
elem e (union (x:xs) ys) = (elem e (x:xs)) || (elem e ys)

elem e (union (x:xs) ys) 
= elem e (nub ((x:xs) ++ ys))                   {U0}
= elem e ((x:xs) ++ ys)                         {ej6 ii}
= elem e (foldr (:) ys xs)                      {++}
= elem e ((:) x (foldr (:) ys xs))              {def foldr}
= elem e (x : (foldr (:) ys xs))
= (e == x) || elem e (foldr (:) ys xs)          {def elem}
= (e == x) || elem e (xs ++ ys)                 {++}
= (e == x) || elem e nub(xs ++ ys)              {ej6 iii}
= (e == x) || elem e (union xs ys)              {N0}
= (e == x) || (elem e xs) || (elem e ys)        {HI}
= (elem e (x:xs)) || (elem e ys)                {def elem}

```
