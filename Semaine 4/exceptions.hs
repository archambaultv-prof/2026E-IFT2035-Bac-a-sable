data MonMaybe a = MErreur | MSucces a

diviser :: Int -> Int -> MonMaybe Int
diviser _ 0 = MErreur        -- échec
diviser a b = MSucces (a `div` b)  -- succès

a = 5
b = 6
c = 0

-- Utilisation
main1 :: IO ()
main1 = case diviser 10 a of
    MErreur -> putStrLn "Erreur : division par zéro"
    MSucces r  ->
        case diviser r b of
            MErreur -> putStrLn "Erreur : division par zéro"
            MSucces r2 ->
                case diviser r2 c of
                    MErreur -> putStrLn "Erreur : division par zéro"
                    MSucces r3 -> putStrLn $ "Résultat final : " ++ show r3

bind :: MonMaybe a -> (a -> MonMaybe b) -> MonMaybe b
bind MErreur _ = MErreur
bind (MSucces x) f = f x

main2 :: IO ()
main2 = case diviser 10 a `bind`( \r1 ->
             diviser r1 b `bind` (\r2 ->
             diviser r2 c )) of
    MErreur -> putStrLn "Erreur : division par zéro"
    MSucces r3 -> putStrLn $ "Résultat final : " ++ show r3

diviser3 :: Int -> Int -> Maybe Int
diviser3 _ 0 = Nothing        -- échec
diviser3 a b = Just (a `div` b)  -- succès

main3 :: Maybe Int
main3 = do
    r1 <- diviser3 10 a
    r2 <- diviser3 r1 b
    diviser3 r2 c

main4 :: IO ()
main4 = case main3 of
    Nothing -> putStrLn "Erreur : division par zéro"
    Just r3 -> putStrLn $ "Résultat final : " ++ show r3