// adder :: Int -> (Int -> Int)
// adder n = \x -> x + n

int adder(int x, int n) {
    return x + n;
}

void adder(int n, int (*f)(int)) {
    f = adder(, n);
}