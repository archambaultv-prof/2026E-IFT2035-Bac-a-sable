f :: Int -> Int
f x = x + 1

f2 :: Int -> Int -> Int
f2 x y = x + y

f3 :: Int -> Int  -- Type pour la signature
f3 x = let y = x * x  -- Rarement pour les définitions internes
       in y + 1

y = f "Hello World"