# Python — boucle for (ordre naturel)
def somme(n):
    total = 0
    for i in range(1, n + 1):
        total = total + i
    return total

def somme2(n):
    total = 0
    for i in range(n+1, 0, -1):
        total = total + i
    return total


def hanoi_iter(n, src, dst, aux):
    moves = []
    pile = [(n, src, dst, aux)]   # pile de tâches à accomplir
    while pile:
        disques, s, d, a = pile.pop()
        if disques == 1:
            moves.append((s, d))  # déplacement atomique
        else:
            # Pousser les trois sous-tâches en ordre inverse (pile LIFO)
            pile.append((disques - 1, a, d, s))  # étape 3 — en dernier
            pile.append((1,           s, d, a))  # étape 2
            pile.append((disques - 1, s, a, d))  # étape 1 — en premier
    return moves