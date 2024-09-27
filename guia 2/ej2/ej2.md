# Ejercicio 2

Demostrar las siguientes igualdades utilizando el principio de extensionalidad funcional:

## i.
```haskell
-- quiero ver que:
flip . flip = id
```
```haskell
-- recordemos que:
{COMP} (f . g) x y = f (g x y)
{F} flip f x y = f y x
-- que se puede re escribir como:
{F} flip = (\f x y -> f y x)
```

Por extensionalidad de funciones, basta con probar que:
```haskell
∀ f::(a->b->c), ∀ x::a , ∀ y::b .
(flip . flip) f x y = id f x y
```

```haskell
(flip . flip) f x y
= ((flip . flip) f) x y        {asociacion a izquierda}
= (flip (flip f)) x y          {COMP}
= (\w z -> (flip f) z w) x y   {F}
=b flip f y x   
= f y x                        {F}
= id f y x                     {def id}
```

## ii.
Quiero probar que:
```haskell
∀ f::(a,b)->c . uncurry (curry f) = f
```
Por extensionalidad de funciones, basta con probar que:

```haskell
∀ t::(a,b). uncurry (curry f) t = f t
```
Aca puedo usar extensionalidad de tuplas
```haskell
∃ x::a , ∃ y::b . t = (x,y) 
-- quiero ver que:
∃ x::a , ∃ y::b . uncurry (curry f) (x,y) = f (x,y)
```
Entonces:
```haskell
uncurry (curry f) (x,y)   {U}
= (curry f) x y           {C}
= curry f x y             {asociacion a izquierda}
= f (x,y)                 {C}
```


## iii.

Rercordemos que:
```haskell
const x y = x
-- escrito de otra forma:
const x = (\y -> x) 
```

Por extensionalidad de funciones, basta con probar que:
```haskell
∀ x::a, ∀ y::b . (flip const) x y = (const id) x y
```

```haskell
flip const x y
= const y x         {def flip}
= y                 {def const}
= id y              {def id}
= (const id x) y    {def const}
= const id x y      {asociacion a izquierda}
```


## iv.

Quiero ver que:
```haskell
∀ f::a->b . ∀ g::b->c . ∀ h::c->d . ((h . g) . f) = (h . (g . f))
```

Recordemos que:
```haskell
{C} (.) f g x = f (g x)
```

Por extensionalidad de funciones, basta con probar que:
```haskell
∀ x::a . ((h . g) . f) x = (h . (g . f)) x
```

```haskell
((h . g) . f) x 
= (h . g) (f x)     {C}
= h (g (f x))       {C}
= h ((g . f) x)     {C}
= (h . (g . f)) x   {C}
```