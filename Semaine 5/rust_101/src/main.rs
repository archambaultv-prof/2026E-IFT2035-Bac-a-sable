// ERREUR : la taille d'Arbre est infinie —
// un Noeud contient deux Arbre, qui contiennent chacun deux Arbre…
enum Arbre {
    Feuille(i32),
    Noeud(Arbre, Arbre),
}




// Le compilateur ne sait pas si la valeur retournée provient de x ou de y.
// Il doit donc garantir que le résultat est valide aussi longtemps que
// les DEUX sources sont valides — d'où l'annotation commune 'a.
fn plus_longue<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() >= y.len() { x } else { y }
}

fn main() {
    let s1 = String::from("longue chaîne");   // lifetime : toute la fonction
    let resultat;
    {
        let s2 = String::from("xy");           // lifetime : bloc intérieur
        resultat = plus_longue(&s1, &s2);
        println!("{}", resultat);  // ok — utilisé avant la fin de s2
    }                              // s2 désalloué ici
    // println!("{}", resultat);  // ERREUR : s2 n'existe plus,
                                  // resultat pourrait pointer vers s2
}