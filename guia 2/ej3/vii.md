## vii
```haskell
-- quiero ver que: 
reverse = foldr (\x rec -> rec ++ (x:[])) []
```

Por extensionalidad de funciones, basta con probar que:
```haskell
∀ xs::[a] . reverse xs = foldr (\x rec -> rec ++ (x:[])) [] xs
```
Para esto ultimo, vamos a usar induccion sobre listas

### Caso Base:
```haskell
-- quiero ver que:
reverse [] = foldr (\x rec -> rec ++ (x:[])) [] []

reverse []                                     
= []                                        {def reverse}
= foldr (\x rec -> rec ++ (x:[])) [] []     {def foldr}
```

### Paso inductivo:
```haskell
-- HI:
reverse xs = foldr (\x rec -> rec ++ (x:[])) [] xs

-- quiero ver que:
reverse (x:xs) = foldr (\x rec -> rec ++ (x:[])) [] (x:xs)
```

```haskell
-- se flipea el (:), ya que la funcion que toma foldl como parametro, debe 
-- tener como primer argumento, el acumulador.

-- usamos el macro: f = (\z rec -> rec ++ (z:[]))

reverse (x:xs)
= foldl (flip (:)) [] (x:xs)                            {R0}
= foldl (flip (:)) (flip (:) [] x) xs                   {def foldl}
= foldl (flip (:)) (x:[]) xs                            {def flip}

= (foldl (flip (:)) [] xs) ++ [x]                       {lema F}

= (reverse xs) ++ (x:[])                                {def reverse}
= (foldr (\z rec -> rec ++ (z:[])) [] xs) ++ (x:[])     {HI}
= (\z rec -> rec ++ (z:[])) x (foldr f [] xs)           {def foldr}
= foldr (\z rec -> rec ++ (z:[])) [] (x:xs)             {def foldr}

-- una manera mas intuitiva de pensar los 3 ulitmos pasos es mirarlos en orden inverso.
```

Ahora probemos el lema F:
```haskell
foldl (flip (:)) (x:[]) xs = (foldl (flip (:)) [] xs) ++ [x]
```

### Caso Base

```haskell
-- quiero ver que:
foldl (flip (:)) (x:[]) [] = (foldl (flip (:)) [] []) ++ [x]

foldl (flip (:)) (x:[]) [] 
= (x:[])
= [] ++ (x:[])
= (foldl (flip (:)) [] []) ++ (x:[])
```
### Paso inductivo

```haskell
-- HI: 
foldl (flip (:)) (x:[]) xs = (foldl (flip (:)) [] xs) ++ [x]

-- quiero ver que:
foldl (flip (:)) (x:[]) (e:xs) = (foldl (flip (:)) [] (e:xs)) ++ [x]

foldl (flip (:)) (x:[]) (e:xs) 
= foldl (flip (:)) (flip (:) [] x) (e:xs) 
= foldl (flip (:)) [] (x:e:xs) 


```
























  



