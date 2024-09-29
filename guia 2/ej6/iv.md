## iv.


## iii.

```haskell    
∀ xs::[a] . ∀ f::(a->b) . length (map f xs) = length xs

```

Lo probamos con induccion estructural sobre listas:

### Caso Base
```haskell  
-- quiero ver que:
length (map f []) = length []

length (map f []) 
= lenght []         {def map}
```

### Paso inductivo
```haskell   
-- HI :
length (map f xs) = length xs

-- quiero ver que:
length (map f (x:xs)) = length (x:xs)

= length (map f (x:xs)) 
= length (f x : map f xs)   {def map}
= 1 + length (map f xs)     {L1}
= 1 + length (xs)           {HI}
= length (x:xs)             {L1}
```