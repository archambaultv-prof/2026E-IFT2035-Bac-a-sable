import threading

class Compte:
    def __init__(self, solde_initial):
        self.solde = solde_initial
        self._lock = threading.Lock()

    def depot(self, montant):
        with self._lock:
            self.solde += montant

    def retrait(self, montant):
        with self._lock:
            if self.solde >= montant:
                self.solde -= montant
                return True
            return False

    def get_solde(self):
        with self._lock:
            return self.solde