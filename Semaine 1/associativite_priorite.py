print(4 == 5 == False)
x = 5
# Pourquoi and et or priorite basse
if 4 + x > 10 and x < 10:
    print("x est entre 5 et 10")

# Si priorité de and plus haute que <, alors on aurait besoin de parenthèses.
if (4 + x > 10) and (x < 10):
    print("x est entre 5 et 10")
