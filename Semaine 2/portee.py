def foo(x):
    def bar():
        return x * 2
    return bar

x = 7
myBar = foo(x)
x = 8
print(myBar())


a = 2
def foo2():
    return a * 2

print(foo2())
a = 3
print(foo2())




def bar(x):
    return x * 2





y = 3
def foo3():
    return 2 + y

def foo4(y):
    return y + foo3()

y = 4
print(foo4(5))