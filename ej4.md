1) Definir la función permutaciones :: [a] -> [[a]], que dada una lista devuelve todas sus perm. Se recomienda utilizar concatMap :: (a -> [b]) -> [a] -> [b], y también take y drop.

```haskell
concatMap :: (a -> [b]) -> [a] -> [b]
-- creates a list from a list generating function by application of this function on all elements in a list passed as the second argument
-- map a function over all the elements of a container and concatenate the resulting lists.

Input: concatMap (enumFromTo 1) [1,3,5]
Output: [1, 1,2,3, 1,2,3,4,5]

-- creates a list, the first argument determines, how many items should be taken from the list passed as the second argument
Input: take 5 [1,2,3,4,5,6,7]
Output: [1,2,3,4,5]

-- dropea tantos elementos del principio de una lista como nos indique el primer argumento.
Input: drop 5 [1,2,3,4,5,6,7,8,9,10]
Output: [6,7,8,9,10]
```

```haskell

```