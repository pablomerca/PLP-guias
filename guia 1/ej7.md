i. mapPares, una versión de map que toma una función currificada de dos argumentos y una lista de pares
de valores, y devuelve la lista de aplicaciones de la función a cada par. Pista: recordar curry y uncurry

```haskell
mapPares :: (a -> b -> c) -> [(a,b)] -> [c]
mapPares f [] = []
mapPares f (x:xs) = ((uncurry f) x) : (mapPares f xs)
```

ii. armarPares, que dadas dos listas arma una lista de pares que contiene, en cada posición, el elemento
correspondiente a esa posición en cada una de las listas. Si una de las listas es más larga que la otra,
ignorar los elementos que sobran (el resultado tendrá la longitud de la lista más corta). Esta función en
Haskell se llama zip. Pista: aprovechar la currificación y utilizar evaluación parcial

```haskell
armarPares :: [a] -> [b] -> [(a,b)]
armarPares [] = const []
armarPares (x:xs) = \y -> if null y then [] else (x, head y):(armarPares xs $ tail y)
```


iii. mapDoble, una variante de mapPares, que toma una función currificada de dos argumentos y dos listas
(de igual longitud), y devuelve una lista de aplicaciones de la función a cada elemento correspondiente de
las dos listas. Esta función en Haskell se llama zipWith.


```haskell
mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
mapDoble f xs ys = mapPares f $ armarPares xs ys
```
Observaciones y errores:
```haskell
mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
mapDoble f = mapPares f $ armarPares 

-- ^^^ aca no podemos usar $ ya que es como si directamente le estuviesemos pasandoo armarPares como argumento a (mapPares f)
-- lo cual es un error de type.
```

```haskell
mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
mapDoble f = (mapPares f) . armarPares

-- creo q la composicion toma solo funciones de un solo argumento.
-- armarPares :: [a] -> [b] -> [(a,b)]
-- cuando le paso el primer argumento a armar pares, este le devuelve a mapPares f un ([b] -> [(a,b)]), lo cual
-- no tipa con lo que espera mapPares f :: [(a,b)] -> [c]
```
