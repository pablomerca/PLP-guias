removeAt :: Int -> [a] -> [a]
removeAt i l = take i l ++ drop (i+1) l

permutaciones :: [a] -> [[a]]
permutaciones [] = [[]]
permutaciones l = concatMap (\i -> map (l !! i :) (permutaciones (removeAt i l))) [0..(length l - 1)]

-- dado l =
-- permutaciones l = (x1 : permutaciones (l - {x1})) ++ (x2 : permutaciones (l - {x2})) ++ ... ++ (xn : permutaciones (l - {xn}))

-- take i l : toma los primeros i elementos de la lista l.
-- drop i l : nos deja una lista a la que le quitamos los primeros i elementos.
-- l !! i : nos devuelve el i-esimo elemento de la lista (indexa en 0).


-- ##########################################################################

partes :: [a] -> [[a]]
partes [] = [[]]
partes (x:xs) = (map (x:) (partes xs)) ++ partes xs

-- usando foldr
partes' :: [a] -> [[a]]
partes' = foldr (\x rec -> (map (x:) rec) ++ rec) [[]]


-- ############################################################################33

-- prefijos :: [[a]] -> [a] -> [[a]]
-- prefijos acu [] = acu
-- prefijos acu (x:xs) = prefijos ((prefijos xs) ++ [(last (prefijos xs)) ++ [x]]) xs

prefijos :: [[a]] -> [a] -> [[a]]
prefijos acu [] = acu
prefijos acu (x:xs) = prefijos (acu ++ [(last acu) ++ [x]]) xs

prefijos' :: [a] -> [[a]]
prefijos' = foldl (\acu x -> (acu ++ [(last acu) ++ [x]])) [[]]

