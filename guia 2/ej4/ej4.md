# Ejercicio 4

Demostrar las siguientes propiedades utilizando inducción estructural sobre listas y el principio de extensionalidad.

## i.

```haskell
reverse . reverse = id
```

Por principio de extensionalidad sobre listas, basta con probar:
```haskell
∀ xs::[a] . (reverse . reverse) xs = id xs
```
Lo probamos con induccion estructural sobre listas:

### Caso Base
```haskell
-- quiero ver que:
(reverse . reverse) [] = id []

(reverse . reverse) []
= reverse (reverse [])      {(.)}
= reverse []                {def reverse}
= []                        {def reverse}
= id []                     {def id}
```

### Paso inductivo
```haskell   
-- HI :
(reverse . reverse) xs = id xs

-- quiero ver que:
(reverse . reverse) (x:xs) = id (x:xs)
```

```haskell
(reverse . reverse) (x:xs)
= reverse (reverse (x:xs))                                 {(.)}
= reverse (foldr (\y rec -> rec ++ (y:[])) [] (x:xs))      {def reverse}

-- con f = (\y rec -> rec ++ (y:[]))

= reverse ((\y rec -> rec ++ (y:[])) x (foldr f [] xs))     
= reverse (foldr f [] xs) ++ (x:[])                        {β}
= reverse ((reverse xs) ++ (x:[]))                         {def reverse}
...
```

usamos el siguiente lema (demo al final):
```haskell
reverse (xs ++ ys) = (reverse ys ++ reverse xs)
```

```haskell
...
= (reverse (x:[])) ++ (reverse (reverse xs))                 {lema R}
= (reverse (x:[])) ((reverse . reverse) xs)                  {(.)}
= (reverse (x:[])) ++ (id xs)                                {HI}
= (foldr (\y rec -> rec ++ (y:[])) [] (x:[])) ++ (id xs)     {def foldr}
= ((\y rec -> rec ++ (y:[])) x (foldr f [] [])) ++ (id xs)   {def foldr}
= ((\y rec -> rec ++ (y:[])) x []) ++ (id xs)                {def foldr}
= ([] ++ x:[]) ++ (id xs)                                    {β}
= x:[] ++ (id xs)                                            {++}
= [x] ++ xs                                                  {def id}
= (x:xs)                                                     {ej3 iii}
= id (x:xs)
```



## ii.

```haskell
map id = id
```

Por principio de extensionalidad sobre listas, basta con probar:
```haskell
∀ xs::[a]. map id xs = id xs
```
Lo probamos con induccion estructural sobre listas:

### Caso Base
```haskell
-- quiero ver que:
map id [] = id []

mad id [] 
= []            {M0}
= id []         {def id}
```

### Paso inductivo
```haskell   
-- HI :
map id xs = id xs

-- quiero ver que:
map id (x:xs) = id (x:xs)

map id (x:xs) 
= id x : map xs     {def map}
= x : map xs        {def id}
= x : id xs         {HI}
= x:xs              {def id}
= id (x:xs)         {def id}
```



## iii.

```haskell
∀ f::a->b : ∀ g::b->c : map (g . f) = map g . map f
```

Por principio de extensionalidad sobre listas, basta con probar:
```haskell
∀ xs::[a] . map (g . f) xs = (map g . map f) xs
```
Lo probamos con induccion estructural sobre listas:

### Caso Base
```haskell
-- quiero ver que:
map (g . f) [] = (map g . map f) []

map (g . f) [] 
= []
= map g []
= map g (map f [])
= (map g . map f) []
```

### Paso inductivo
```haskell   
-- HI :
map (g . f) xs = (map g . map f) xs

-- quiero ver que:
map (g . f) (x:xs) = (map g . map f) (x:xs)

map (g . f) (x:xs) 
= (g . f) x :  (map (g . f) xs)         {def map}
= (g . f) x : (map g . map f) xs        {HI}
= (g . f) x : (map g (map f xs))        {(.)}
= g (f x) : (map g (map f xs))          {(.)}
= map g ((f x) : map f xs)              {def map}
= map g (map f (x:xs))                  {def map}
= (map g . map f) (x:xs)                {(.)}

-- los ultimos 4 pasos, es mas facil verlos de abajo hacia arriba.
```





## iii.

```haskell

```

Por principio de extensionalidad sobre listas, basta con probar:
```haskell

```
Lo probamos con induccion estructural sobre listas:

### Caso Base
```haskell
-- quiero ver que:

```

### Paso inductivo
```haskell   
-- HI :

-- quiero ver que:

```
