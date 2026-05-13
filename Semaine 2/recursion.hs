-- somme 4
-- → 4 + somme 3          -- on retient « ajouter 4 au résultat »
-- → 4 + (3 + somme 2)    -- on retient « ajouter 3 au résultat »
-- → 4 + (3 + (2 + somme 1))
-- → 4 + (3 + (2 + (1 + somme 0)))
-- → 4 + (3 + (2 + (1 + 0)))
-- → 10

s4 :: Int
s4 = somme 4

somme :: Int -> Int
somme 0 = 0
somme n = n + somme (n - 1)