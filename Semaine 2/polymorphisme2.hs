{- HLINT ignore "Use foldr" -}

data Resultat a = Erreur4 | Succes4 a

premierElement :: [a] -> Resultat a
premierElement [] = Erreur4
premierElement (x:_) = Succes4 x



test1 = premierElement [1, 2, 3] -- Succes4 1




longueurInt :: [Int] -> Int
longueurInt []       = 0
longueurInt (_ : xs) = 1 + longueurInt xs

longueurBool :: [Bool] -> Int
longueurBool []       = 0
longueurBool (_ : xs) = 1 + longueurBool xs


-- somme :: [a] -> Int
-- somme [] = 0
-- somme (x:xs) = x + somme xs


sommeInt :: [Int] -> Int
sommeInt [] = 0
sommeInt (x:xs) = x + sommeInt xs

sommeDouble :: [Double] -> Double
sommeDouble [] = 0
sommeDouble (x:xs) = x + sommeDouble xs


class SupporteAddition a where
    addition :: a -> a -> a
    valeurNeutre :: a

instance SupporteAddition Int where
    addition :: Int -> Int -> Int
    addition x y = x + y
    valeurNeutre :: Int
    valeurNeutre = 0

instance SupporteAddition Double where
    addition :: Double -> Double -> Double
    addition x y = x + y
    valeurNeutre :: Double
    valeurNeutre = 0.0

sommeGenerique :: SupporteAddition a => [a] -> a
sommeGenerique [] = valeurNeutre
sommeGenerique (x:xs) = addition x (sommeGenerique xs)

test2 :: Int
test2 = sommeGenerique [1, 2, 3] -- 6

test2' :: Int
test2' = sommeGenerique2 [1, 2, 3] -- 6
    where
        sommeGenerique2 :: [Int] -> Int
        sommeGenerique2 [] = 0
        sommeGenerique2 (x:xs) = x + (sommeGenerique2 xs)


test3 :: Double
test3 = sommeGenerique [1.5, 2.5, 3.0] -- 7.0
