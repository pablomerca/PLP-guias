# Ejercicio 12

## i.

Recordemos de la practica 1

```haskell
-- {F0}
foldPoli :: b -> (a -> b) (Poli a -> Poli a -> b) (Poli a -> Poli a -> b) -> b
foldPoli cX fc fs fm p = case p of
    X           -> cX
    Cte k       -> fc k
    Suma q r    -> fs (foldPoli cX fc fs fm q) (foldPoli cX fc fs fm r)
    Prod q r    -> fp (foldPoli cX fc fs fm q) (foldPoli cX fc fs fm r)

-- {E0}
evaluar :: Num a => a -> Polinomio a -> a
evaluar n = foldPoli n id (+) (*)
```

## Enunciado

Demostrar:

```haskell    
Num a => ∀ p::Polinomio a . ∀ q::Polinomio a . ∀ r::a . (esRaiz r p ) ⟹ esRaiz r (Prod p q)
```

Lo probamos con induccion estructural sobre polinomios:

### Caso Base
```haskell  
-- quiero ver que vale para los contructores base:

-- X:
    (esRaiz r X) ⟹ esRaiz r (Prod X q)

    (esRaiz r X)
    = evaluar r X == 0
    = foldPoli r id (+) (*) X == 0
    = (r == 0)

    -- caso r == 0
        ⟹ (r * (foldPoli r id (+) (*) q)) == 0
        = ((foldPoli r id (+) (*) X) * (foldPoli r id (+) (*) q)) == 0      {F0}
        = foldPoli r id (+) (*) (Prod X q) == 0                             {F0}
        = evaluar r (Prod X q) == 0                                         {E0}
        = esRaiz r (Prod X q)                                               {def esRaiza}

    -- caso r /= 0 se cumple trivialmente: false --> cualquier cosa

-- Cte k:
    (esRaiz r (Cte k)) ⟹ esRaiz r (Prod (Cte k) q)

    esRaiz r (Cte k)
    = evaluar r (Cte k) == 0
    = foldPoli r id (+) (*) (Cte k) == 0
    = (id k) == 0
    = k == 0

    -- caso k == 0:
        ⟹ (k * (foldPoli r id (+) (*) q)) == 0
        = ((id k) * (foldPoli r id (+) (*) q)) == 0                             {F0}
        = ((foldPoli r id (+) (*) (Cte k)) * (foldPoli r id (+) (*) q)) == 0    {F0}
        = foldPoli r id (+) (*) (Prod (Cte k) q) == 0                           {F0}
        = evaluar r (Prod (Cte k) q) == 0                                       {E0}
        = esRaiz r (Prod (Cte k) q)                                             {def esRaiz}

    -- caso k /= 0 se cumple trivialmente: false --> cualquier cosa
```

### Paso inductivo
```haskell   
-- quiero ver que vale para todos los constructores recursivos:

-- HI 
∀ a::Polinomio a . ∀ b::Polinomio a .
(esRaiz r a) ⟹ esRaiz r (Prod a q)
(esRaiz r b) ⟹ esRaiz r (Prod b q)


-- (Suma p q) 
(esRaiz r (Suma a b)) ⟹ esRaiz r (Prod (Suma a b) q)

(esRaiz r (Suma a b))
= evaluar r (Suma a b) == 0                                                                     {def esRaiz}
= foldPoli r id (+) (*) (Suma a b) == 0                                                         {E0}
= ((foldPoli r id (+) (*) a) + (foldPoli r id (+) (*) b)) == 0                                  {F0}
= (evaluar r a) + (evaluar r a) == 0                                                            {E0}

    -- caso (evaluar r a) + (evaluar r a) == 0
    ⟹ ((evaluar r a) + (evaluar r b)) * (evaluar r q) == 0                                      {HI}
    = ((foldPoli f id (+) (*) a) + (foldPoli f id (+) (*) b)) * (foldPoli f id (+) (*) q) == 0   {E0}
    = (foldPoli f id (+) (*) (Suma a b)) * (foldPoli f id (+) (*) q) == 0                        {F0}
    = foldPoli r id (+) (*) (Prod (Suma a b) q) == 0                                             {F0}
    = evaluar r (Prod (Suma a b) q) == 0                                                         {E0}
    = esRaiz r (Prod (Suma a b) q)                                                               {def esRaiz}

    -- caso (evaluar r a) + (evaluar r a) /= 0 , trivialmente cierto: false --> cualquier cosa

-- (Prod p q) , es lo mismo que arriba, solo que usamos (*) envez de (+).
```








