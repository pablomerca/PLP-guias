## v.


```haskell    
Eq a => ∀ xs::[a] . ∀ ys::[a] . length (union xs ys) = length xs + length ys
```
Esto no es cierto, veamos un contraejemplo:

xs = [1,1,1]
ys = [2,2,2]

lenght (union xs ys) = 2
lenght xs + length ys = 3 + 3 = 6

al aplicar union, estamos eliminando los repetidos de las listas, asi que se puede ver
modificada su longitud.

