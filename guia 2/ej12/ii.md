
# Ejercicio 12

## ii.

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

-- {D0}
derivado :: Num a => Polinomio a -> Polinomio a
derivado poli = case poli of
    X -> Cte 1
    Cte _ -> Cte 0
    Suma p q -> Suma (derivado p) (derivado q)
    Prod p q -> Suma (Prod (derivado p) q) (Prod (derivado q) p)
```

## Enunciado

Demostrar:

```haskell    
Num a => ∀ p::Polinomio a . ∀ k::a . ∀ e::a .
evaluar e (derivado (Prod (Cte k) p)) = evaluar e (Prod (Cte k) (derivado p))

-- (k.p)'(e) = (k.p') (e)  esto es cierto ya que el termino (k'.p) = 0.
```

Lo probamos con induccion estructural sobre polinomios:

### Caso Base
```haskell  
-- quiero ver que vale para los contructores base:

-- X:
    evaluar e (derivado (Prod (Cte k) X)) = evaluar e (Prod (Cte k) (derivado X))

    evaluar e (derivado (Prod (Cte k) X))       
    = evaluar e (Suma (Prod (derivado (Cte k)) X) (Prod (derivado X) (Cte k)))      {D0}
    = evaluar e (Suma (Prod (Cte 0) X) (Prod (Cte 1) (Cte k)))                      {D0}
    = (evaluar e (Prod (Cte 0) X)) + (evaluar e (Prod (Cte 1) (Cte k)))             {E0, F0}
    = (Cte 0 * e) + (Cte 1 * Cte k)                                                 {E0, F0}
    = Cte 0 + Cte k                                                                 {E0, F0}    
    = Cte k
    = (Cte k) * (Cte 1)
    = (evaluar e (Cte k)) * (evaluar e (Cte 1))                                     {E0}
    = (evaluar e (Cte k)) * (evaluar e (derivado X))                                {D0}
    = evaluar e (Prod (Cte k) (derivado X))                                         

-- (Cte c):
    evaluar e (derivado (Prod (Cte k) (Cte c))) = evaluar e (Prod (Cte k) (derivado (Cte c)))

    evaluar e (derivado (Prod (Cte k) (Cte c)))       
    = evaluar e (Suma (Prod (derivado (Cte k)) (Cte c)) (Prod (derivado (Cte c)) (Cte k)))      {D0}
    = evaluar e (Suma (Prod (Cte 0) (Cte c)) (Prod (Cte 0) (Cte k)))                            {D0}
    = evaluar e (Suma (Prod (Cte 0) (Cte c)) (Prod (Cte 0) (Cte k)))                            {D0}
    = elvaluar e (Prod (Cte 0) (Cte c)) + evaluar e (Prod (Cte 0) (Cte k))                      {E0}
    = (evaluar e (Cte 0) * evaluar e (Cte c)) + (evaluar e (Cte 0) * evaluar e (Cte k))
    = ((Cte 0) * (Cte c)) + ((Cte 0) * (Cte k))
    = (Cte 0) + (Cte 0)
    = Cte 0
    = (Cte k) * (Cte 0)
    = evaluar e (Cte k) * evaluar e (Cte 0)                                                     {E0}
    = evaluar e (Cte k) * evaluar e (derivado (Cte c))                                          {D0}
    = evaluar e (Prod (Cte k) (derivado (Cte c)))                                               {E0}
```

### Paso inductivo
```haskell   
-- quiero ver que vale para todos los constructores recursivos:

-- HI 
∀ a::Polinomio a .
evaluar e (derivado (Prod (Cte k) p)) = evaluar e (Prod (Cte k) (derivado p))




-- (Suma p q) 
-- quiero ver que:
∀ p::Polinomio a . ∀ q::Polinomio a .
evaluar e (derivado (Prod (Cte k) (Suma p q))) = evaluar e (Prod (Cte k) (derivado (Suma p q)))

evaluar e (derivado (Prod (Cte k) (Suma p q))) 
= evaluar e (Suma (Prod (derivado (Cte k)) (Suma p q)) (Prod (derivado (Suma p q)) (Cte k))) {D0} 
= evaluar e (Suma (Prod (Cte 0) (Suma p q)) (Prod (derivado (Suma p q)) (Cte k)))            {D0}
= evaluar e (Prod (Cte 0) (Suma p q)) + evaluar e (Prod (derivado (Suma p q)) (Cte k))       {E0}
= (Cte 0) + evaluar e (Prod (derivado (Suma p q)) (Cte k))                                   {Producto por 0}
= evaluar e (Prod (derivado (Suma p q)) (Cte k))                                             
= evaluar e (derivado (Suma p q)) * evaluar e (Cte k)                                        {E0}
= evaluar e (Cte k) * evaluar e (derivado (Suma p q))                                   {conmutatividad de (*)}
= evaluar e (Prod (Cte k) (derivado (Suma p q)))                                        {E0}


derivado poli = case poli of
    X -> Cte 1
    Cte _ -> Cte 0
    Suma p q -> Suma (derivado p) (derivado q)
    Prod p q -> Suma (Prod (derivado p) q) (Prod (derivado q) p)


-- (Prod p q) , es lo mismo que arriba, solo que usamos (*) envez de (+).
```


