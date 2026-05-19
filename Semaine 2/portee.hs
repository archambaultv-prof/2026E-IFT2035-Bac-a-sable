type Nom = String

data Exp
  = Lit  Int           -- littéral entier
  | Var  Nom           -- variable,          ex : Var "x"
  | Lam  Nom  Exp      -- abstraction lambda, ex : Lam "x" (Var "x")
  | App  Exp  Exp      -- application,        ex : App (Var "f") (Lit 3)
  | Plus Exp  Exp      -- addition
  | If   Exp  Exp Exp  -- conditionnel (condition non-nulle = vrai)
  deriving (Show)

data Val
  = VInt Int
  | VFun Nom Exp Env   -- paramètre, corps, environnement capturé
  deriving (Show)

type Env = [(Nom, Val)]

chercher :: Nom -> Env -> Val
chercher x [] = error ("Variable non définie : " ++ x)
chercher x ((y, v) : reste)
  | x == y    = v
  | otherwise = chercher x reste

eval :: Env -> Exp -> Val
eval env (Lit n)       = VInt n
eval env (Var x)       = chercher x env
eval env (Lam x corps) =
    VFun x corps env  -- capturer l'environnement actuel
eval env (App f arg)   =
    case eval env f of
        VFun x corps envF -> eval ((x, eval env arg) : envF) corps
        _ -> error "Application d'une valeur non fonctionnelle"
eval env (Plus e1 e2)  =
    case (eval env e1, eval env e2) of
        (VInt n1, VInt n2) -> VInt (n1 + n2)
        _ -> error "Addition de non-entiers"
eval env (If cond t f) =
    case eval env cond of
        VInt 0 -> eval env f
        VInt _ -> eval env t
        _ -> error "Condition non entière"