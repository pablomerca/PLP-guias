1) Cuál es el tipo de cada función? (Suponer que todos los números son de tipo Float). 

```haskell
max ::  (Float, Float) -> Float

normaVectorial :: (Float, Float) -> Float

-- flip :: (a -> b -> c) -> (b -> a -> c)
subtract :: Float -> Float -> Float

predecesor :: Float -> Float

evaluarEnCero :: (Float -> a) -> a

dosVeces :: (a -> a) -> (a -> a)

-- toma una lista de funciones y devuelve una lista con las funciones flipeadas.
flipAll :: [(a -> b -> c)] -> [(b -> a -> c)]

-- flipear 2 veces una funcion es lo mismo que no haber hecho nada, es como una identidad.
flipRaro :: (a -> b -> c) -> (a -> b -> c)
```

2)
Indicar cuáles de las funciones anteriores no están currificadas. Para cada una de ellas, definir la función
currifcada correspondiente. Recordar dar el tipo de la función.

```haskell
-- En este caso, las implementaciones de las funciones no cambian.

max2Curr x y :: Float -> Float -> Float

normaVectorialCurr :: Float -> Float -> Float
```