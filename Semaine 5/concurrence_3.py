import threading
import time

# Variable globale partagée - source potentielle de race condition
compteur = 0

def incrementer_compteur(nb_iterations):
    """Fonction qui incrémente le compteur - CONTIENT UNE CONDITION DE COURSE

    Cette fonction illustre parfaitement le problème des conditions de course.
    Chaque thread tente d'incrémenter le compteur global, mais sans
    synchronisation, les résultats sont imprévisibles.
    
    Args:
        nb_iterations (int): Nombre d'incrémentations à effectuer
    """
    global compteur
    nom_thread = threading.current_thread().name
    
    for i in range(nb_iterations):
        # ❌ RACE CONDITION ICI - SECTION CRITIQUE NON PROTÉGÉE
        # Cette opération simple se décompose en réalité en 3 étapes :
        # 1. Lire la valeur actuelle de 'compteur'
        # 2. Calculer la nouvelle valeur (valeur_actuelle + 1)  
        # 3. Écrire la nouvelle valeur dans 'compteur'
        
        valeur_actuelle = compteur                    # Étape 1: LECTURE
        # time.sleep(0.000001)                         # Simule une opération qui prend du temps
        compteur = valeur_actuelle + 1               # Étapes 2 & 3: CALCUL et ÉCRITURE
        
        # Affichage périodique pour suivre le progrès
        if i % 1000 == 0:
            print(f"{nom_thread}: {i}/{nb_iterations} (compteur = {compteur})")

def demonstration_condition_de_course():
    """Démontre de manière reproductible une condition de course
    
    Cette fonction orchestre plusieurs threads pour créer les conditions
    nécessaires à l'apparition d'une condition de course et mesure l'impact
    sur le résultat final.
    """
    global compteur

    print("=== Démonstration Condition de Course ===")
    print("Chaque thread va incrémenter le compteur plusieurs fois...")
    print("Sans synchronisation, le résultat final sera incorrect.\n")
    
    # Réinitialiser le compteur
    compteur = 0
    
    # Paramètres de test
    nb_iterations = 5000     # Assez grand pour voir l'effet
    nb_threads = 3           # Plusieurs threads en compétition
    
    threads = []
    start_time = time.time()
    
    print(f"Configuration: {nb_threads} threads, {nb_iterations} incréments chacun")
    print(f"Résultat attendu: {nb_threads * nb_iterations}\n")
    
    # Créer et lancer tous les threads simultanément
    for i in range(nb_threads):
        thread = threading.Thread(
            target=incrementer_compteur,
            args=(nb_iterations,),
            name=f"Thread-{i+1}"
        )
        threads.append(thread)
        thread.start()
        print(f"Démarrage de {thread.name}")
    
    # Attendre que tous les threads se terminent
    for thread in threads:
        thread.join()
        print(f"{thread.name} terminé")
    
    duree = time.time() - start_time
    resultat_attendu = nb_threads * nb_iterations
    
    # Analyser les résultats
    print(f"=== Résultats ===")
    print(f"Résultat attendu: {resultat_attendu:,}")
    print(f"Résultat obtenu:  {compteur:,}")
    print(f"Différence:       {resultat_attendu - compteur:,}")
    print(f"Pourcentage d'erreur: {((resultat_attendu - compteur) / resultat_attendu * 100):.1f}%")
    print(f"Temps d'exécution: {duree:.2f}s")
    
    if compteur != resultat_attendu:
        print("\n❌ RACE CONDITION DÉTECTÉE!")
        print("Les threads ont interféré les uns avec les autres.")
        print("Certaines incrémentations ont été perdues.")
    else:
        print("\n✅ Pas de race condition détectée (par chance rare)")
        print("Relancez le programme plusieurs fois pour voir l'effet.")

# Exécuter la démonstration
if __name__ == "__main__":
    print("Ce programme démontre une race condition classique.")
    print("Exécutez-le plusieurs fois pour voir des résultats différents.\n")
    
    demonstration_condition_de_course()
    
    print("\n💡 Observation:")
    print("À chaque exécution, vous devriez obtenir un résultat différent.")
    print("C'est le signe caractéristique d'une condition de course.")