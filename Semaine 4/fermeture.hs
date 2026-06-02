-- Haskell : adder retourne une fermeture qui capture n
adder :: Int -> (Int -> Int)
adder n = \x -> x + n

add10 = adder 10
add10 5   -- 15