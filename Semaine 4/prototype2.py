def foo():
    x = bar()
    return x


def bar():
    return 42

x = foo()
print(x)