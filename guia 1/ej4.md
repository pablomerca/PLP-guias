1) Definir la función permutaciones :: [a] -> [[a]], que dada una lista devuelve todas sus perm. Se recomienda utilizar concatMap :: (a -> [b]) -> [a] -> [b], y también take y drop.

```haskell
concatMap :: (a -> [b]) -> [a] -> [b]
-- creates a list from a list generating function by application of this function on all elements in a list passed as the second argument
-- map a function over all the elements of a container and concatenate the resulting lists.

Input: concatMap (enumFromTo 1) [1,3,5]
Output: [1, 1,2,3, 1,2,3,4,5]

-- toma los primeros i elementos de la lista, (i es el 1er arg)
Input: take 5 [1,2,3,4,5,6,7]
Output: [1,2,3,4,5]

-- dropea tantos elementos del principio de una lista como nos indique el primer argumento.
Input: drop 5 [1,2,3,4,5,6,7,8,9,10]
Output: [6,7,8,9,10]
```

```ascii
Se pueden armar las permutaciones de forma recursiva como se muestra en este arbol.

/
├── 1
│   ├── 2
│   │   └── 3
│   └── 3
│       └── 2
├── 2
│   ├── 1
│   │   └── 3
│   └── 3
│       └── 1
└── 3
    ├── 1
    │   └── 2
    └── 2
        └── 1
```

si contamos con las permutaciones de las listas correspondientes a quitar solo el i-esimo elemento, entonces a cada una de las permutaciones de una lista (para todas las listas), tenemos que agregarles adelante, el i-esimo elemento que se quito. Luego concatenamos todas las listas de permutaciones en una sola.

$$p\ l=\left(map\ (x_1:)\ p(l-x_1)\right)++\left(map\ (x_2:)p(l-x_2)\right)++...++\left(map\ (x_n:)\ p(l-x_n)\right)$$


```haskell
removeAt :: Int -> [a] -> [a]
removeAt i l = take i l ++ drop (i+1) l

permutaciones :: [a] -> [[a]]
permutaciones [] = [[]]
permutaciones l = concatMap (\i -> map (l !! i :) (permutaciones (removeAt i l))) [0..(length l - 1)]
```


2)
Definir la función partes, que recibe una lista L y devuelve la lista de todas las listas formadas por los
mismos elementos de L, en su mismo orden de aparición.
Ejemplo: partes [5, 1, 2] -> [[], [5], [1], [2], [5, 1], [5, 2], [1, 2], [5, 1, 2]]
(en algún orden).

```ascii
p {b,c} =
{}
{b}
{c}
{b, c}

p {a,b,c}
{}
{a}
{b}
{c}
{a, b}
{a, c}
{b, c}
{a, b, c}
```

```haskell
partes :: [a] -> [[a]]
partes [] = [[]]
partes (x:xs) = (map (x:) (partes xs)) ++ partes xs

-- usando foldr
partes' :: [a] -> [[a]]
partes' = foldr (\x rec -> (map (x:) rec) ++ rec) [[]]
```


3) Definir la función prefijos, que dada una lista, devuelve todos sus prefijos.
Ejemplo: prefijos [5, 1, 2] -> [[], [5], [5, 1], [5, 1, 2]]

```haskell
prefijos :: [[a]] -> [a] -> [[a]]
prefijos acu [] = acu
prefijos acu (x:xs) = prefijos (acu ++ [(last acu) ++ [x]]) xs

prefijos' :: [a] -> [[a]]
prefijos' = foldl (\acu x -> (acu ++ [(last acu) ++ [x]])) [[]]
```