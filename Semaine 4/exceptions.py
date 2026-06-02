def diviser(a, b):
    if b == 0:
        raise ValueError("Division par zéro interdite")
    return a / b

try:
    resultat = diviser(10, 0)
    print(f"Résultat : {resultat}")  # jamais atteint
except ValueError as e:
    print(f"Erreur : {e}")          # "Erreur : Division par zéro interdite"
finally:
    print("Nettoyage (toujours exécuté)")

def open_file(filename):
    with open(filename, 'r') as f:
        return f.read()