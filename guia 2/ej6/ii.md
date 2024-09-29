## ii.  


```haskell  
Eq a => ∀ xs::[a] . ∀  e::a . elem e xs = elem e (nub xs)
```

Esto es verdad, lo probamos con induccion estructural sobre listas:

### Caso Base
```haskell
-- quiero ver que:
elem e [] = elem e (nub [])

elem e [] 
= false
= elem e []         {def elem}
= elem e (nub [])   {N0}
```

### Paso inductivo
```haskell   
-- HI :
elem e xs = elem e (nub xs)

-- quiero ver que:
elem e (x:xs) = elem e (nub (x:xs))

elem e (x:xs) 
= (e == x) || elem e xs             {def elem}
= (e == x) || elem e (nub xs)       {HI}

-- caso (e == x)
= true || elem e (nub xs)           
= true
= true || (elem e (filter (\y -> x /= y) (nub xs)))
= (e == x) || (elem e (filter (\y -> x /= y) (nub xs)))     
= elem e (x : filter (\y -> x /= y) (nub xs))               {def elem}
= elem e (nub (x:xs))                                       {N1}

-- caso e != x
= false || elem e (nub xs)       
= (e == x) || elem e (nub xs)       
= elem e (x : nub xs)                           {def elem}
= elem e (x : filter (\y -> x /= y) (nub xs))   {lema}
= elem e (nub (x:xs))                           {N1}
```

### Lema  
Si (z != e) entonces vale que:  

```haskell
elem e xs = elem e (z : filter (\y -> z /= y) xs)
```

Vamos a usar induccion estructural sobre listas.  

### Caso Base

```haskell

-- suponiendo que z != e

-- quiero ver que:
elem e [] = elem e (z : filter (\y -> z /= y) [])

elem e []
= false
= (z == e) || false
= (z == e) || elem e []                             {def elem}
= (z == e) || elem e (filter (\y -> z /= y) [])     {def filter}
= elem e (z : filter (\y -> z /= y) [])             {def elem}
```

### Paso inductivo
```haskell   
-- HI :
elem e xs = elem e (z : filter (\y -> z /= y) xs)

-- quiero ver que:
elem e (x:xs) = elem e (z : filter (\y -> z /= y) (x:xs))

elem e (x:xs) 
= (x == e) || elem e xs                                     {def elem}
= (x == e) || elem e (z : filter (\y -> z /= y) xs)         {HI}

-- caso (x == e) y (z /= e) --> (z /= x)
= true || elem e (z : filter (\y -> z /= y) xs)  
= true
= true || elem e (filter (\y -> z /= y) xs)
= (x == e) || elem e (filter (\y -> z /= y) xs)
    -- caso x pasa el filtro (z /= x)
    = elem e (x : filter (\y -> z /= y) xs)                 {def elem}
    = elem e (filter (\y -> z /= y) (x:xs))                 
    = false || elem e (filter (\y -> z /= y) (x:xs))
    = (z == e) || elem e (filter (\y -> z /= y) (x:xs))
    = elem e (z : filter (\y -> z /= y) (x:xs))

    -- caso x no pasa el filtro (z == x) (imposible)
    = true || elem e (filter (\y -> z /= y) xs)
    = (z == e) || elem e (filter (\y -> z /= y) (x:xs))
    = elem e (z : filter (\y -> z /= y) (x:xs))             {def elem}

-- caso (x /= e) y (z /= e)
= (x == e) || elem e (filter (\y -> z /= y) xs)
= false || elem e (filter (\y -> z /= y) xs)
= elem e (filter (\y -> z /= y) xs)
    -- caso x pasa el filtro (z /= x)

    -- caso x no pasa el filtro (z == x)

... mucho texto

= (z == e) || elem e (filter (\y -> z /= y) (x:xs))
= elem e (z : filter (\y -> z /= y) (x:xs))
```







