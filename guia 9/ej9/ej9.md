![alt text](image.png)

```
BlockClosure << generarBloqueInfinito
    ^ BlockClosure generarBloqueInfinito: 1.


BlockClosure << generarBloqueInfinito: n
    ^[ #( n [BlockClosure generarBloqueInfinito: n+1] ) ].

```