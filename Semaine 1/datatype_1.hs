import Language.Haskell.TH (Exp)
foo nom age fonction salaire =
    let salutation = "Bonjour " ++ nom ++ ", vous avez " 
                     ++ show age ++ " ans et vous travaillez comme " 
                     ++ fonction ++ "."
    in salutation

data Personne = Personne String Int String Float

nomPersonne :: Personne -> String
nomPersonne (Personne nom _ _ _) = nom
agePersonne :: Personne -> Int
agePersonne (Personne _ age _ _) = age
fonctionPersonne :: Personne -> String
fonctionPersonne (Personne _ _ fonction _) = fonction
salairePersonne :: Personne -> Float
salairePersonne (Personne _ _ _ salaire) = salaire

data Duo = Duo Personne Personne

fooPersonne (Personne nom age fonction salaire) =
    let salutation = "Bonjour " ++ nom ++ ", vous avez " 
                     ++ show age ++ " ans et vous travaillez comme " 
                     ++ fonction ++ "."
    in salutation


data Personne2 = Personne2 {
    nom2 :: String,
    age2 :: Int,
    fonction2 :: String,
    salaire2 :: Float
}


data StringOuInt = StringOu String | IntOu Int
data MonBoolean = Vrai | Faux

stringOuIntToInt :: StringOuInt -> Int
stringOuIntToInt (StringOu s) = length s
stringOuIntToInt (IntOu i) = i

data Expression = Nombre Int
                | Addition Expression Expression
                | Multiplication Expression Expression
                | None

evaluer :: Expression -> Int
evaluer (Nombre n) = n
evaluer (Addition e1 e2) = evaluer e1 + evaluer e2
evaluer (Multiplication e1 e2) = evaluer e1 * evaluer e2
evaluer None = 0