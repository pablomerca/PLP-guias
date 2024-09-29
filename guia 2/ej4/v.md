# Ejericicio 4

## v.


```haskell
∀ f::a->b . ∀ p::b->Bool . map f . filter (p . f) = filter p . map f
```

Por principio de extensionalidad sobre listas, basta con probar:
```haskell
∀ xs::[a] . (map f . filter (p . f)) xs = (filter p . map f) xs
```
Lo probamos con induccion estructural sobre listas:

### Caso Base
```haskell
-- quiero ver que:
(map f . filter (p . f)) [] = (filter p . map f) []

(map f . filter (p . f)) [] 
= map f (filter (p . f) [])
= map f []
= []
= filter p []
= filter p (map f [])
= (filter p . map f) []
```

### Paso inductivo
```haskell   
-- HI :
(map f . filter (p . f)) xs = (filter p . map f) xs

-- quiero ver que:
(map f . filter (p . f)) (x:xs) = (filter p . map f) (x:xs)

(map f . filter (p . f)) (x:xs) 
= map f (filter (p . f) (x:xs))

-- caso (p . f) x = true
map f (filter (p . f) (x:xs))
= map f (x : filter (p . f) xs)             {def filter}
= f x : (map f (filter (p . f) xs))         {def map}
= f x : ((map f . filter (p . f)) xs)       {.}
= f x : (filter p . map f) xs               {HI}
= f x : filter p (map f xs)                 {.}
= filter p (f x : (map f xs))               {def filter}
= filter p (map f (x:xs))                   {def map}
= (filter p . map f) (x:xs)                 {.}

-- caso (p . f) x = false
map f (filter (p . f) (x:xs))
= map f (filter (p . f) xs)             {def filter}
= (map f . filter (p . f)) xs           {.}
= (filter p . map f) xs                 {HI}
= filter p (map f xs)                   {.}
= filter p (f x : map f xs)             {def filter}
= filter p (map f (x:xs))               {def map}
= (filter p . map f) (x:xs)             {.}
```


