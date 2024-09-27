![alt text](image.png)

```haskell
{I} intercambiar (x,y) = (y,x)

{E1} espejar (Left x) = Right x
{E2} espejar (Right x) = Left x

{AI} asociarI (x,(y,z)) = ((x,y),z)

{AD} asociarD ((x,y),z) = (x,(y,z))

{F} flip f x y = f y x

{C1} curry f x y = f (x,y)

{C2} uncurry f (x,y) = f x y
```   

## i.

```haskell
-- quiero ver que:
∀ p::(a,b) . intercambiar (intercambiar p) = p

usamos induccion sobre pares:

Para probar lo del enunciado, basta probar que:
∀x :: a, ∀y :: b. intercambiar (intercambiar (x,y)) = (x,y)

intercambiar (intercambiar (x,y)) = intercambiar (y,x) {I}
                                  = (x,y)              {I}
```


## ii.

```haskell
Uno podria pensar que la forma correcta de usar extension sobre el tipo (a,(b,c)) es:
∃x :: a , ∃y :: b, ∃z :: c . p = (x,(y,z))

Pero la forma completa y correcta seria:
∃x :: a , ∃w :: (b,c) . p = (x,w)
∃y :: b, ∃z :: c . w = (y,z) .p = (x,(y,z))

Se extiende de un paso a la vez de afuera hacia adentro, no?
```

```haskell
-- quiero ver que:
∀ p :: (a,(b,c)) : asociarD (asociarI p) = p

usamos induccion de pares

Para probar lo del enunciado, basta probar que:
    ∀x :: a, ∀y :: b, ∀z :: x. asociarD (asociarI (x,(y,z))) = (x,(y,z))

asociarD (asociarI (x,(y,z))) = asociarD ((x,y), z)   {AI}
                              = (x,(y,z))             {AD}
```

## iii.

```haskell
-- quiero ver que:
∀ p::Either a b : espejar (espejar p) = p

Veamos que vale para los constructores del (Either a b).
Por principio de extensionalidad:

∀p :: Either a b. 
o bien ∃x :: a. p = Left x
o bien ∃y :: b. p = Right x

Caso p = Left x :
espejar (espejar (Left x)) = espejar (Right x)       {ER}
                           = Left y                  {EL}

Caso p = Right x :
espejar (espejar (Right x)) = espejar (Left x)       {EL}
                           = Right y                  {ER}
```

## iv
```haskell
-- quiero ver que:
∀ f::(a->b->c) . ∀ x::a . ∀ y::b . flip (flip f) x y = f x y
```
```haskell
flip (flip f) x y
= (flip f) y x      {F}
= flip f y x        {asociacion a izquierda}
= f x y             {F}
```

## v
```haskell
∀ f::a->b->c . ∀ x::a . ∀ y::b . curry (uncurry f) x y = f x y
```

```haskell
curry (uncurry f) x y 
= (uncurry f) (x,y)     {C}
= uncurry f (x,y)       {asociaciacion a izquierda}
= f x y                 {U}
```