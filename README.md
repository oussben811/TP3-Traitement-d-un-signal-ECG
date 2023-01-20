# TP3 - Traitement d’un signal ECG

## Objectifs
  -  Suppression du bruit autour du signal produit par un électrocardiographe.
  - Recherche de la fréquence cardiaque. 
  
## Introduction
    L'ECG (électrocardiogramme) est un enregistrement de l'activité électrique du cœur.
    Il est utilisé pour diagnostiquer les troubles cardiaques et pour surveiller 
    les patients souffrant de maladies cardiaques. Le traitement d'un signal ECG 
    consiste généralement à enregistrer les signaux électriques du cœur, à les amplifier
    et à les filtrer pour enlever les bruits parasites, puis à les analyser pour détecter
    des anomalies telles que des troubles de la conduction, des arythmies, etc.
    
## Réalisation du TP
### Suppression du bruit provoqué par les mouvements du corps
  
   ![1](https://user-images.githubusercontent.com/78149349/213771903-9b022cf1-d44b-41e9-9979-1f139a6c6512.png)

   ![2](https://user-images.githubusercontent.com/78149349/213771911-2aac3d3e-aaba-42dc-862c-681f4832b963.png)
   
- Remarque

        Ce script effectue un traitement du signal sur un signal ECG. Le script commence
        par charger un fichier appelé "ecg.mat" et définit certaines variables telles que la fréquence d'échantillonnage 
        (fe), la période d'échantillonnage (te) et le nombre d'échantillons (N). Le script trace ensuite le signal ECG 
        original dans le premier sous-graphe et son spectre de fréquence dans le deuxième sous-graphe.
        Ensuite,le script applique un filtre passe-haut au signal ECG en mettant à zéro toutes 
        les fréquences inférieures à une certaine fréquence de coupure (fc) dans le spectre
        de fréquence, puis en utilisant la transformée de Fourier inverse pour obtenir 
        le signal filtré. Le signal filtré est ensuite tracé dans le troisième sous-graphe.

### Suppression des interférences des lignes électriques 50Hz 
 
   ![3](https://user-images.githubusercontent.com/78149349/213771979-7f711650-aa2b-4ec5-b01e-384522c523f0.png)
   ![4](https://user-images.githubusercontent.com/78149349/213771993-c66c0d27-e876-4173-a6e9-547049549246.png)   
   
  - Remarque 
    
        Le script applique ensuite un filtre passe-bande pour éliminer le bruit de 50 Hz, en mettant
        à zéro la fréquence de 50 Hz dans le spectre de fréquence, puis en utilisant la transformée
        de Fourier inverse pour obtenir le signal filtré. Le signal filtré est ensuite tracé dans
        le deuxième sous-graphe de la deuxième figure.

### Amélioration du rapport signal sur bruit

   ![5](https://user-images.githubusercontent.com/78149349/213772179-de764703-4d85-4684-9d19-a9a6b93da304.png)
   ![6](https://user-images.githubusercontent.com/78149349/213772196-ef9f6cd5-45cc-4dfc-8081-99fb07c16a68.png)
   
- Remarque
  
       le script applique un filtre passe-bas au signal pour éliminer les bruits de hautes fréquences, 
       en mettant à zéro toutes les fréquences supérieures à une certaine fréquence de coupure (fc3)
       dans le spectre de fréquence, puis en utilisant la transformée de Fourier inverse pour obtenir
       le signal filtré. Le signal filtré est ensuite tracé dans le troisième sous-graphe de la deuxième figure.

### Identification de la fréquence cardiaque avec la fonction d’autocorrélation
   
   ![Screenshot 2023-01-20 185020](https://user-images.githubusercontent.com/78149349/213772284-6bcbd423-8be9-4acd-ba49-1def3eb5c1ef.png)
   
- Remarque

      Le script effectue ensuite une corrélation croisée entre le signal ECG filtré 
      et lui-même et trace le résultat dans la dernière figure.
      
## Conclusion
       
       En conclusion, ce script fournit un exemple détaillé de l'utilisation de différentes
       techniques de traitement du signal pour filtrer un signal ECG. Il montre l'utilisation
       de filtres passe-haut, de réjection de bande et passe-bas pour éliminer le bruit de 
       différentes fréquences présentes dans le signal d'origine. Les résultats de chaque étape
       de filtrage sont visualisés pour montrer l'effet de chaque filtre sur le signal. 
       Ce script peut être utilisé comme référence pour comprendre les techniques de filtrage 
       utilisées dans la recherche en électrocardiographie.
