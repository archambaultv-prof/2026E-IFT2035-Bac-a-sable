-- Haskell — récursion
somme :: Int -> Int
somme 0 = 0                    -- condition d'arrêt : i == 0
somme n = n + somme (n - 1)    -- ajouter n, puis passer à n-1

sommeTerminal :: Int -> Int -> Int
sommeTerminal 0 acc = acc       -- condition d'arrêt : i == 0
sommeTerminal n acc = sommeTerminal (n - 1) (acc + n) -- ajouter n à l'accumulateur, puis passer à n-1

-- Retourne la liste des déplacements (source, destination)
hanoi :: Int -> String -> String -> String -> [(String, String)]
hanoi 0 _   _   _   = []
hanoi n src dst aux =
    hanoi (n-1) src aux dst    -- 1. déplacer n-1 disques de src vers aux
    ++ [(src, dst)]            -- 2. déplacer le grand disque de src vers dst
    ++ hanoi (n-1) aux dst src -- 3. déplacer n-1 disques de aux vers dst


