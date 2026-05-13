-- Ignorer le premier argument
ignorer :: a -> b -> b
ignorer _ y = y

explosionOuPas :: String
explosionOuPas = ignorer (error "BOUM") "Pas de BOUM"


-- Liste infinie de 1
uns :: [Int]
uns = 1 : uns

trois :: [Int]
trois = [1, 2, 3]

myTake :: Int -> [a] -> [a]
myTake 0 _      = []
myTake _ []     = []
myTake n (x:xs) = x : myTake (n - 1) xs

cinqPremiersUns :: [Int]
cinqPremiersUns = myTake 5 uns