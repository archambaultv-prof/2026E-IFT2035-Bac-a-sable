-- La récursion comme les boucles
{- HLINT ignore "Use map" -}

liste :: [Integer]
liste = [1, 2, 3, 4, 5]

calculNouvelleListe :: [Integer] -> [Integer]
calculNouvelleListe [] = []
calculNouvelleListe (x:xs) = (x * 2) : calculNouvelleListe xs

myMap :: (Integer -> Integer) -> [Integer] -> [Integer]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs

calculNouvelleListe' :: [Integer] -> [Integer]
calculNouvelleListe' = myMap (* 2)

superListe :: [Integer]
superListe = myMap (* 4) liste