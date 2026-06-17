fn doubler(v: &mut Vec<i32>) {
    v.push(42);   // modification autorisée via &mut
}

fn main() {
    let mut nombres = vec![1, 2, 3];
    doubler(&mut nombres);
    println!("{:?}", nombres);   // [1, 2, 3, 42]
}