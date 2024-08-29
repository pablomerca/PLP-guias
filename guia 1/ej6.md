a. Definir la función sacarUna :: Eq a => a -> [a] -> [a], que dados un elemento y una lista devuelve el
resultado de eliminar de la lista la primera aparición del elemento (si está presente).

```haskell
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna e [] = []
sacarUna e (x:xs) = if e == x then xs else x:(sacarUna e xs)

sacarUna' :: Eq a => a -> [a] -> [a]
sacarUna' e = recr (\x xs rec -> if e == x then xs else x:rec) [] 
```
b. Explicar por qué el esquema de recursión estructural (foldr) no es adecuado para implementar la función
sacarUna del punto anterior.

Xq no tenemos acceso a la cola de la lista con el esquema de foldr? Pero xq?


c. Definr la función insertarOrdenado :: Ord a => a -> [a] -> [a] que inserta un elemento en una lista
ordenada (de manera creciente), de manera que se preserva el ordenamiento.

```haskell
insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e [] = [e]
insertarOrdenado e (x:xs) = if x > e then (e:x:xs) else x:(insertarOrdenado e xs)

insertarOrdenado' :: Ord a => a -> [a] -> [a]
insertarOrdenado' e = recr (\x xs rec -> if x > e then (e:x:xs) else x:rec) [e]
```




