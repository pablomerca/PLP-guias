$\textbf{Ejercicio }1$

Dar el tipo y describir el comportamiento de las siguientes funciones del módulo Prelude de Haskell:

null, head, tail, init, last, take, drop, (+), concat, reverse, elem.



```haskell
-- null es una funcion que nos permite saber si una estructura de datos/ container esta vacio o no.
null :: Foldable t => t a -> Bool
```

```haskell
-- nos devuelve el primer elemento de una lista, si la lista esta vacia, llamar a head da un resultado indefinido
head :: [a] -> a
```

```haskell
-- dada una lista, nos devuelve la lista que tiene todos los elementos menos el primero
tail :: [a] -> [a]
```

```haskell
-- toma una lista y retorna la lista sin el ultimo elemento
init :: [a] -> [a]
```

```haskell
-- retorna el ulitmo elemento de una lista, al igual que head, si la lista esta vacia, se indefine
last :: [a] -> a
```

```haskell
-- creates a list, the first argument determines, how many items should be taken from the list passed as the second argument
take :: Int -> [a] -> [a]

Input: take 5 [1,2,3,4,5,6,7]
Output: [1,2,3,4,5]
```

```haskell
-- toma un Int y una lista, retorna la lista a la que se le sacaros tantos elementos del principio como nos dice el primer argumento
drop :: Int -> [a] -> [a]

Input: drop 5 [1,2,3,4,5,6,7,8,9,10]
Output: [6,7,8,9,10]
```

```haskell
-- recive una lista de listas y las junta todas en una sola lista grande.
contat :: [[a]] -> [a]

Input: concat [[1,2,3], [1,2,3]]
Output: [1,2,3,1,2,3]
```

```haskell
-- crea una nueva lista con los elemento en orden reverso
reverse :: [a] -> [a]
```

```haskell
-- dado un elemento y una lista, devuelve true solo si la lista tiene al elemento
elem :: (Foldable t, Eq a) => a -> t a -> Bool

Input: elem 9 [1,2,3,4,5]
Output: False

Input: elem 'o' "Bro"
Output: True
```