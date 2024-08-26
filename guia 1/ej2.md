1) Definir la función curry, que dada una función de dos argumentos, devuelve su equivalente currificada.

```haskell
-- toma una funcion sin currificar y devuelve su versino currificada
curry :: ((a, b) -> c) -> a -> b -> c
curry f x y = f (x,y)
```
2)  Definir la función uncurry, que dada una función currificada de dos argumentos, devuelve su versión no
currificada equivalente. Es la inversa de la anterior.

```haskell
uncurry :: (a -> b -> c) -> ((a,b) -> c)
uncury f (a,b) = f a b
```
3) Se podría definir una función curryN, que tome una función de un número arbitrario de argumentos y
devuelva su versión currificada?

```haskell
-- dicha funcion tendria un aridad como la siguiente:
    curryN :: (t1, t2, ... , tn) -> b
```
