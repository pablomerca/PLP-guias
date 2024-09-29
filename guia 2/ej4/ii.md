
## ii.

```haskell
append = (++)
```

Por principio de extensionalidad sobre listas, basta con probar:
```haskell
∀ xs::[a]. append xs = (++) xs
```
Lo probamos con induccion estructural sobre listas:

### Caso Base
```haskell
-- quiero ver que:
append [] = (++) []

append [] 
= id
= (flip (foldr (:))) []     {lema 1}
= (++) []                   {lema 2}
```
Usamos los siquientes lemas:  

```haskell
-- Lema 1:
(flip (foldr f)) [] = id

-- Lema 2:
(++) xs  = (flip (foldr (:))) xs

-- las demos van a estar en algun momento...
```


### Paso inductivo
```haskell   
-- HI :
append xs = (++) xs

-- quiero ver que:
append (x:xs) = (++) (x:xs)

append (x:xs) 
= (\ys -> x : append xs ys)
= (\ys -> x : (++) xs ys)           {HI}
= (\ys -> (++) (x:xs) ys)           {lema 3}
= (++) (x:xs)                       {ƞ}
```

----
### demo del lema 3:
```haskell
x : (++) xs ys = (++) (x:xs) ys
```
Usamos induccion sobre listas:

### Caso Base:
```haskell
-- quiero ver que:
x : (++) [] ys = (++) (x:[]) ys

x : (++) [] ys 
= x : ys                {def ++}
= [x] ++ ys             {ej3 iii}
= (++) (x:[]) ys        
```

### Paso inductivo
```haskell
-- HI: 
x : (++) xs ys = (++) (x:xs) ys

-- quiero ver que:
x : (++) (e:xs) ys = (++) (x:e:xs) ys

x : (++) (e:xs) ys 
= x : foldr (:) ys (e:xs)               
= x : ((:) e (foldr (:) ys xs))         {def foldr}
= x : ((:) e ((++) xs ys))              {def ++}
= x : (e : (++) xs ys)                  
= x : ((++) (e:xs) ys)                  {HI}
= (:) x (foldr (:) ys (e:xs))           {def ++}
= foldr (:) ys (x:e:xs)                 {def foldr}
= (++) (x:e:xs) ys                      {def ++}

-- los ultimos 4 pasos, es mas facil leerlos de abajo hacia arriba
```





----
### demo del lema 2:

```haskell
(flip (foldr (:))) xs = (++) xs
```

```haskell
(flip (foldr (:))) xs = (++) xs

(flip (foldr (:))) xs 
= (flip (\ys xs' -> foldr (:) ys xs')) xs   {def foldr}
= (\xs' ys -> foldr (:) ys xs') xs          {def flip}
= (\ys -> foldr (:) ys xs)                  {=β}
= (\ys -> (++) xs ys)                       {def ++}
= (++) xs                                   {=ƞ}
```


----
### demo del lema 1:
```haskell
(flip (foldr f)) [] = id
```

Por extensionalidad de funciones, basta ver que:  

```haskell
∀ xs::[a] . (flip (foldr f)) [] xs = id xs
```

```haskell
(flip (foldr f)) [] xs
= (flip (\ys xs' -> foldr f ys xs')) [] xs   {def foldr}
= (\xs' ys -> foldr f ys xs') [] xs          {def flip}
= (\ys -> foldr f ys []) xs                  {=β}
= foldr f xs []                              {=β}
= xs                                         {def foldr}
= id xs                                      {def}
```