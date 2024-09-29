## i

```haskell  
-- remueve elementos repetidos de la lista

-- {N0}
nub [] = []
-- {N1}
nub (x:xs) = x : filter (\y -> x /= y) (nub xs)
```

```haskell  
union :: Eq a => [a] -> [a] -> [a]
-- {U0}
union xs ys = nub (xs++ys)
```

```haskell  
intersect :: Eq a => [a] -> [a] -> [a]
-- {I0}
intersect xs ys = filter (\e -> elem e ys) xs
```


## Enunciado

```haskell  
Eq a =>  ∀ xs::[a] . ∀  e::a . ∀  p::a -> Bool . elem e xs && p e = elem e (filter p xs)
```
Esto es verdad, vamos a demostrarlo.


```haskell
elem e xs && p e = elem e (filter p xs)
```

Lo probamos con induccion estructural: 

### Caso Base
```haskell
-- quiero ver que:
elem e [] && p e = elem e (filter p [])

elem e [] && p e 
= false && p e
= false
= elem e []
= elem e (filter p [])
```

### Paso inductivo
```haskell   
-- HI :
elem e xs && p e = elem e (filter p xs)

-- quiero ver que:
elem e (x:xs) && p e = elem e (filter p (x:xs))

elem e (x:xs) && p e 
= ((e == x) || elem e xs) && (p e)
= ((e == x) && p e) || ((elem e xs) && (p e))    {de morgan}
= ((e == x) && p e) || (elem e (filter p xs))    {HI}

-- caso ((e == x) && p e) = true
= true || (elem e (filter p xs))    {HI}
= true 
= (e == x) || elem e (filter p xs)  
= elem e (x : filter p xs)
= elem e (filter p (x:xs))

-- caso ((e == x) && p e) = false
= false || (elem e (filter p xs))    
= elem e (filter p xs)             
= elem e (filter p (x:xs))          {def filter}
```




