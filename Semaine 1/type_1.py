def f(x: int) -> int:
    return x + 1

y = f(3.14)
print(y)

class AWithAdd:
    def __add__(self, other: int) -> int:
        return 42