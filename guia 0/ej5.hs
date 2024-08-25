-- AB a es un arbol binario de tipo generico a.
-- tenemos 2 constructores posibles
-- Nil
-- Bin (AB a) a (AB a)
data AB a = Nil | Bin (AB a) a (AB a)

vacioAB :: AB a -> Bool
vacioAB Nil = True
vacioAB a = False

negacionAB :: AB Bool -> AB Bool
negacionAB Nil = Nil
negacionAB (Bin cl r cr) = Bin (negacionAB cl) (not r) (negacionAB cr)

productoAB :: AB Int -> Int
productoAB (Bin Nil r Nil) = r
productoAB Nil = 0
productoAB (Bin cl r cr) = r * (productoAB cl) * (productoAB cr)

-- arboles de testeo

arbolInt :: AB Int
arbolInt = Bin (Bin Nil 4 Nil) 5 (Bin Nil 6 Nil)

arbolBool :: AB Bool
arbolBool = Bin (Bin Nil False Nil) True (Bin Nil True Nil)

