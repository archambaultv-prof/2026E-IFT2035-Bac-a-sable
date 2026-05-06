# Préfix par défaut pour les fonctions avec nom
def foo(x):
    return x + 1

foo            (1)

ma_fonction = foo
mon_appel = foo                             (1)

print(type(ma_fonction))
print(type(mon_appel))