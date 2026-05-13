import Graphics.Win32 (aD_CLOCKWISE)
x1 = 1 -- Une valeur ne peut être réduite davantage.
x2 = 234254325 + 443543254325 * 324543524  -- Un calcul

-- Tout TOUT TOUT TOUT en Haskell calcul une valeur.
z = if x1 < 1 then "Plus petit que 1" else "Plus grand que 1"

-- Syntaxe : nom param1 param2 ... = corps
double x = x * 2

carre x = x * x

hypotenuse a b = 
    let a_au_carre = a * a
        b_au_carre = b * b
    in sqrt (a_au_carre + b_au_carre)

hypotenuse' a b = sqrt (a * a + b * b)

hypotenuse2 a b = 
    let a_au_carre = a * a
        b_au_carre = b * b
    in let a_au_carre = 0
       in sqrt (a_au_carre + b_au_carre)