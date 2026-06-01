/* Sans annotation, le compilateur ne sait pas quelle lifetime
   associer à la valeur de retour */
fn longest(x: & String, y: & String) -> & String {
    if x.len() > y.len() { x } else { y }
}

fn main() {
    let s1 = String::from("long string");
    let result;
    {
        let s2 = String::from("xy");
        result = longest(&s1, &s2);
        println!("{}", result);   // ok — result utilisé avant la fin de s2
    }
    // println!("{}", result);   // ERREUR : s2 est désalloué, result serait fou
}