# Ejercicio 9

Recordemos de la practica 1:  

```haskell  
foldAB :: (a -> b -> b -> b) -> b -> AB a -> b
{F0} foldAB f cNil Nil = cNil
{F1} foldAB f cNil (Bin hi r hd) = f r (foldAB f cNil hi) (foldAB f cNil hd) 
```

```haskell  
cantNodos :: AB a -> Int
{C0} cantNodos = foldAB (\r recI recD -> recI + recD + 1) 0
```

```haskell
altura :: AB a -> Int
{A0} altura = foldAB (\r recI recD -> 1 + (max recI recD)) 0
```

## Enunciado
Dadas las funciones altura y cantNodos definidas en la práctica 1 para árboles binarios, demostrar la
siguiente propiedad:

```haskell
∀ x::AB a . altura x ≤ cantNodos x
```

Lo probamos con induccion estructural sobre arboles.


### Caso Base
```haskell  
-- quiero ver que:
altura Nil ≤ cantNodos Nil

altura Nil
= foldAB (\r recI recD -> recI + recD + 1) 0 Nil    {A0}
= 0                                                 {F0}
= foldAB (\r recI recD -> recI + recD + 1) 0 Nil    {F0}
= cantNodos Nil                                     {C0}

-- si vale el = , vale el ≤
```

### Paso inductivo
```haskell   
-- HI :
altura i ≤ cantNodos i
altura d ≤ cantNodos d

-- quiero ver que:
altura (Bin i r d) ≤ cantNodos (Bin i r d)

altura (Bin i r d)
= foldAB (\r recI recD -> 1 + (max recI recD)) 0 (Bin i r d)                {A0}
= (\r recI recD -> 1 + (max recI recD)) r (foldAB f 0 i) (foldAB f 0 d)     {F1}
    -- con f = (\r recI recD -> 1 + (max recI recD))
= 1 + (max (foldAB f 0 i) (foldAB f 0 d))                                   {=β}
= 1 + (max (altura i) (altura d))                                           {A0}
≤ 1 + (altura i) + (altura d)
≤ 1 + (cantNodos i) + (cantNodos d)                                         {HI}
= 1 + (foldAB f' 0 i) + (foldAB f' 0 i)
    -- con f' = (\r recI recD -> recI + recD + 1)
= (\r recI recD -> recI + recD + 1) r (foldAB f' 0 i) (foldAB f' 0 d)         
= foldAB (\r recI recD -> recI + recD + 1) 0 (Bin i r d)                    {C0}
= cantNodos (Bin i r d)

```
