from itertools import islice

def foo(a, b):
    pass

# result = foo(1, 2)
# print(type(result))
# print(type(None))

# foo(1 + 3, 2 * 5)

# print(1 + 3)
# print(2 * 5)

# # OU

# print(4)
# print(10)

foo(print(1 + 3), print(2 * 5))

# foo(exit(1), print("Hello"))


def naturels(n=0):
    while True:
        yield n
        n += 1

trois = [1,2,3]

list(islice(naturels(), 10))  # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

def bar(x, y):
    return x * y

s = 0
for i in range(10):
    for j in range(10):
        s += bar(i + j, i * j)