import Control.Concurrent       (forkIO, threadDelay)
import Control.Concurrent.STM
import Control.Monad            (forever, when)
import Data.IORef               (IORef, newIORef, modifyIORef, readIORef)

-- Transfert atomique entre deux TVar
transfert :: TVar Int -> TVar Int -> Int -> STM Bool
transfert source destination montant = do
    s <- readTVar source
    if s < montant
        then return False
        else do
            modifyTVar source      (subtract montant)
            modifyTVar destination (+montant)
            return True

main :: IO ()
main = do
    compte_a <- newTVarIO 500
    compte_b <- newTVarIO 100
    let invariant = 600

    violations <- newIORef (0 :: Int)   -- compteur de violations
    observations <- newIORef (0 :: Int) -- compteur total d'observations

    -- Thread 1 : faire des transferts en boucle
    forkIO $ forever $ do
        atomically $ transfert compte_a compte_b 50
        atomically $ transfert compte_b compte_a 50

    -- Thread 2 : vérifier l'invariant en permanence
    forkIO $ forever $ do
        total <- atomically $ do
            a <- readTVar compte_a
            b <- readTVar compte_b
            return (a + b)
        modifyIORef observations (+1)
        when (total /= invariant) $
            modifyIORef violations (+1)

    -- Laisser tourner 1 seconde
    threadDelay 1000000

    v  <- readIORef violations
    n  <- readIORef observations
    let pct = fromIntegral v / fromIntegral n * 100 :: Double
    putStrLn $ "Observations : " ++ show n
    putStrLn $ "Violations   : " ++ show v
                ++ " (" ++ show (round pct :: Int) ++ "%)"
    if v == 0
        then putStrLn "OK: Invariant toujours respecte"
        else putStrLn "ERREUR: Invariant viole !"