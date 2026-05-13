-- data Maybe a = Nothing | Just a

data ResultatInt = Erreur | Succes Int
data ResultatString = Erreur2 | Succes2 String
data ResultatBool = Erreur3 | Succes3 Bool

afficherErreurInt :: ResultatInt -> String
afficherErreurInt Erreur = "Une erreur est survenue."
afficherErreurInt (Succes _) = "Tout va bien"

-- afficherErreurString :: ResultatString -> String
afficherErreurString Erreur2 = "Une erreur est survenue."
afficherErreurString (Succes2 _) = "Tout va bien"

afficherErreurBool :: ResultatBool -> String
afficherErreurBool Erreur3 = "Une erreur est survenue."
afficherErreurBool (Succes3 _) = "Tout va bien"

data Resultat a = Erreur4 | Succes4 a

type ResultatInt2 = Resultat Int
type ResultatString2 = Resultat String
type ResultatBool2 = Resultat Bool

-- afficherErreur :: Resultat a -> String
afficherErreur Erreur4 = "Une erreur est survenue."
afficherErreur (Succes4 _) = "Tout va bien"