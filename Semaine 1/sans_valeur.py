import math

# hypotenuse a b = sqrt (a * a + b * b)
def hypotenuse(a, b):
    a_au_carre = a * a
    b_au_carre = b * b
    return math.sqrt(a_au_carre + b_au_carre)
