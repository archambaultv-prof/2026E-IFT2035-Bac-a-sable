import threading
import time
import concurrent.futures

def tache_simple(nom, duree):
    """Tâche qui simule du travail et retourne un résultat"""
    print(f"Début de {nom}")
    time.sleep(duree)
    resultat = f"Résultat de {nom}"
    print(f"Fin de {nom}")
    return resultat

# ❌ Méthode manuelle (complexe et verbeuse)
print("=== Gestion manuelle des threads ===")
threads = []
resultats = []

def wrapper(nom, duree, resultats_list):
    """Wrapper nécessaire pour capturer les résultats"""
    resultat = tache_simple(nom, duree)
    resultats_list.append(resultat)

# Créer et démarrer manuellement
for i in range(3):
    t = threading.Thread(target=wrapper, args=(f"Tâche-{i+1}", 1, resultats))
    threads.append(t)
    t.start()

# Attendre manuellement
for t in threads:
    t.join()

print(f"Résultats manuels: {resultats}")

# ✅ Méthode ThreadPoolExecutor (simple et élégante)
print("\n=== Avec ThreadPoolExecutor ===")
with concurrent.futures.ThreadPoolExecutor(max_workers=3) as executor:
    # Soumettre toutes les tâches
    futures = [executor.submit(tache_simple, f"Tâche-{i+1}", 1) for i in range(3)]
    
    # Récupérer les résultats
    resultats_pool = [future.result() for future in futures]

print(f"Résultats pool: {resultats_pool}")