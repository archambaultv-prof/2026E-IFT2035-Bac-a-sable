data Exemple = A Int Int
             | B Int Int Int

foo :: Exemple -> Int
foo (A _ y) = 2 * y
foo (B x _ y) = x + y

data Point = Point Float Float

fooPoint :: Point -> Float
fooPoint (Point x y) = sqrt (x^2 + y^2)


data MaListe a = Vide | Cons a (MaListe a)
-- [], :

estVide2 :: [a] -> Bool
estVide2 [] = True
estVide2 (_:_) = False

estVide :: MaListe a -> Bool
estVide Vide = True
estVide (Cons _ _) = False

longueur :: MaListe a -> Int
longueur Vide = 0
longueur (Cons _ xs) = 1 + longueur xs


foo2 :: MaListe Int -> Int
foo2 xs = case xs of
            Vide -> 0
            Cons x _ -> x