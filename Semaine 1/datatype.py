personne = ("Alice", 30, "ingénieur", 50000)

nom = personne[0]

class Personne:
    def __init__(self, nom, age, fonction, salaire):
        self.nom = nom
        self.age = age
        self.fonction = fonction
        self.salaire = salaire

p1 = Personne("Alice", 30, "ingénieur", 50000)
nom2 = p1.nom

def afficher_personne(p: Personne):
    print(f"Nom: {p.nom}, Age: {p.age}, Fonction: {p.fonction}, Salaire: {p.salaire}")





v = True
f = False

if 3 == 4:
    print("3 est égal à 4")
else:
    print("3 n'est pas égal à 4")


def stringOuIntToInt(x):
    if isinstance(x, int):
        return x
    elif isinstance(x, str):
        return int(x)
    else:
        raise ValueError("L'argument doit être une chaîne de caractères ou un entier")
    
class Expression:
    def __init__(self, type_noeud, valeur):
        self.type_noeud = type_noeud
        self.valeur = valeur

e1 = Expression("nombre", 5)
e2 = Expression("addition", [e1, Expression("nombre", 3)])

class Nombre:
    def __init__(self, valeur):
        self.valeur = valeur

class Addition:
    def __init__(self, gauche, droite):
        self.gauche = gauche
        self.droite = droite

class Multiplication:
    def __init__(self, gauche, droite):
        self.gauche = gauche
        self.droite = droite