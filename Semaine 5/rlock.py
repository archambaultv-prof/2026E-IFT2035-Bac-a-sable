import threading
import time

class CompteurAvecLock:
    """Exemple montrant le problème avec un Lock normal"""
    
    def __init__(self):
        self._valeur = 0
        self._lock = threading.Lock()  # Lock normal
    
    def incrementer(self):
        """Incrémente la valeur"""
        with self._lock:
            self._valeur += 1
            # ❌ PROBLÈME: Appel d'une méthode qui veut aussi le lock
            self._log_operation("increment")  # DEADLOCK!
            return self._valeur
    
    def _log_operation(self, operation):
        """Méthode qui veut aussi acquérir le lock"""
        with self._lock:  # ❌ DEADLOCK: le thread a déjà le lock!
            print(f"Thread {threading.current_thread().name}: {operation} -> {self._valeur}")
    
    def get_valeur(self):
        with self._lock:
            return self._valeur

# ❌ Ce code va se bloquer indéfiniment
def test_lock_probleme():
    """Démontre le problème avec Lock normal"""
    compteur = CompteurAvecLock()
    
    def worker():
        try:
            print("Avant incrementer...")
            compteur.incrementer()  # Se bloque ici!
            print("Après incrementer...")
        except Exception as e:
            print(f"Erreur: {e}")
    
    thread = threading.Thread(target=worker)
    thread.start()
    thread.join(timeout=2)  # Timeout de 2 secondes
    
    if thread.is_alive():
        print("❌ DEADLOCK détecté! Le thread est bloqué.")
    else:
        print("✅ Opération terminée normalement.")

# Décommentez pour tester (attention au blocage!)
# test_lock_probleme()