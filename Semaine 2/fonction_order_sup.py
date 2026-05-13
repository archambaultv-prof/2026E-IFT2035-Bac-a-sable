liste = [1, 2, 3, 4, 5]

nouvelle_liste = []
for x in liste:
    nouvelle_liste.append(x * 2)

nouvelle_liste = [x * 2 for x in liste]

def foo(x):
    return x * 2

x = foo
print(type(x))