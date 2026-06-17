import threading

# Variable partagée — accessible par tous les threads du processus
donnees = []

lock = threading.Lock()

def producteur():
    for i in range(5):
        with lock:
            donnees.append(i)  # Écriture directe dans la mémoire partagée


def consommateur():
    import time
    time.sleep(0.05)
    with lock:
        print("Données lues:", donnees)  # Lecture directe de la mémoire partagée

t1 = threading.Thread(target=producteur)
t2 = threading.Thread(target=consommateur)
t1.start()
t2.start()
t1.join()
t2.join()