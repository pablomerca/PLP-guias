1) Redefinir usando foldr las funciones sum, elem, (++), filter y map


```haskell
sum = foldr (+) 0
```

```haskell
-- elem returns True if the list contains an item equal to the first argument
-- version sin foldr
elem :: a -> [a] -> Bool
elem _ [] = false
elem e (x:xs) = (e == x) || (elem e xs)

-- con foldr, notemos que si o si tenemos que tomar e en la funcion elem,
-- no podemos esperar q lo tome del foldr, ya que sino no cierra la aridad de f
elem e = foldr (\x rec -> (x == e) || rec) False
```

```haskell
(++) :: [a] -> [a] -> [a]
-- sin foldr
(++) [] ys = ys
(++) (x:xs) ys = x : (++) xs ys

-- con foldr
(++) xs ys = foldr (:) ys xs
```

```haskell
filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr (\x recu -> if p x then x : recu else recu) []
```

```haskell
map :: (a -> b) -> [a] -> [b]
map f = foldr (\x recu -> (f x):recu) []
```

Todos los elementos que la funcion f del foldr necesita pero que no puede tomar directamente por su aridad, los tengo que tomar como parametro de la funcion que estoy definiendo.


2) Definir la función mejorSegún :: (a -> a -> Bool) -> [a] -> a, que devuelve el máximo elemento
de la lista según una función de comparación, utilizando foldr1. Por ejemplo, maximum = mejorSegún
(>).


- Type Signature: foldr1 :: (a -> a -> a) -> [a] -> a
- Initial Accumulator: foldr1 does not require an explicit initial accumulator value; instead, it uses the last element of the list as the initial accumulator.
- Usage: It can only be used with non-empty lists.
- Behavior: foldr1 applies the function to the last element and the second-to-last element, then continues to fold from right to left.

```haskell
foldr1 :: (a -> a -> a) -> [a] -> a
foldr1 _ [x]    = x
foldr1 f (x:xs) = f x (foldr1 f xs)
foldr1 _ []     = error "foldr1: empty list"
```


```haskell
-- version sin foldr
mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun cmp [x] = x
mejorSegun cmp (x:xs) = if cmp x (segunMejor xs) then x else segunMejor xs  

-- version con foldr
mejorSegun cmp = foldr1 (\x recu -> if cmp x recu then x else recu)
```
3) Definir la función
sumasParciales :: Num a => [a] -> [a], que dada una lista de números devuelve
otra de la misma longitud, que tiene en cada posición la suma parcial de los elementos de la lista original
desde la cabeza hasta la posición actual. Por ejemplo, sumasParciales [1,4,-1,0,5] ; [1,5,4,4,9]

```haskell
sumasParciales :: [Int] -> [Int]
sumasParciales =  reverse . snd . foldl (\(prevSum, acu) x -> (prevSum + x, ((prevSum + x) : acu))) (0, [])

sumasParcialess :: [Int] -> [Int]
sumasParcialess = reverse . snd . foldl (\(prevSum, acc) x -> let newSum = prevSum + x in (newSum, newSum : acc)) (0, [])
```

4)  Definir la función sumaAlt, que realiza la suma alternada de los elementos de una lista. Es decir, da como
resultado: el primer elemento, menos el segundo, más el tercero, menos el cuarto, etc. Usar foldr.

```haskell 
sumaAlt' :: [Int] -> Int
sumaAlt' [] = 0
sumaAlt' (x:xs) = x - (sumaAlt' xs)

sumaAlt :: [Int] -> Int
sumaAlt = foldr (\x acc -> x - acc) 0
```
$$\begin{aligned}s[1,2,3]&=1-s[2,3]\\&=1-(2-s[3])=1-2+s[3]\\&=1-2+3-\underbrace{s[0]}_{0}\end{aligned}$$

5) Hacer lo mismo que en el punto anterior, pero en sentido inverso (el último elemento menos el anteúltimo,
etc.). Pensar qué esquema de recursión conviene usar en este caso.

```haskell

sumaAltL :: [Int] -> Int
sumaAltL = foldl (\acc x -> x - acc) 0
```
se explica facil con esto
$$\mathrm{foldl~(★)~z~[a,~b,~c]~=~((z~★~a)~★~b)~★~c}$$


