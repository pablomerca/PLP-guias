Considerar las siguientes funciones:
Indicar si la recursión utilizada en cada una de ellas es o no estructural. Si lo es, reescribirla utilizando foldr.

En caso contrario, explicar el motivo.

```haskell
elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares [] = []
elementosEnPosicionesPares (x:xs) = if null xs
                                    then [x]
                                    else x : elementosEnPosicionesPares (tail xs)
```
elementosEnPosicionesPares no es un caso de recursion estrucural valido, ya que utiliza xs con null.


```haskell
entrelazar :: [a] -> [a] -> [a]
entrelazar [] = id
entrelazar (x:xs) = \ys ->  if null ys
                            then x : entrelazar xs []
                            else x : head ys : entrelazar xs (tail ys)
```


```haskell
entrelazar :: [a] -> [a] -> [a]
entrelazar [] = id
entrelazar (x:xs) ys =  if null ys
                        then x : entrelazar xs []
                        else x : head ys : entrelazar xs (tail ys)
```
entrelazar es un caso de recursion estructural valido, se puede re-escribir como: