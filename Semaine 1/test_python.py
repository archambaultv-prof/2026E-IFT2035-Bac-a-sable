if None:
    print("None est vrai")
else:
    print("None est faux")

if 2 == True:
    print("2 est True")
else:
    print("2 n'est pas True")


lst = [1, 2, 3]
if lst:
    print("La liste n'est pas vide")


if 0:
    print("0 est vrai")
else:
    if 2:
        print("2 est vrai")
    if 3:
        print("3 est vrai")
    else:
        print("2 est faux")