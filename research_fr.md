# Recherche

<!-- ## Calcul à Haute Performance -->

<!-- ### Calcul sur GPU -->

<!-- Les GPU développent une importante puissance de calcul à partir d'un relative faible consommation énergétique. De nombreuses applications peuvent bénéficier d'accélération significatives en utilisant ces GPU. -->

<!-- - Utilisation des GPU comme accélérateurs pour les parties intensives des applications -->
<!-- - Optimisation de code, d'algorithmes et de méthodes pour exploiter l'architecture GPU -->

<!-- ### Calcul hybride -->

<!-- Les architectures matérielles actuelles sont génératlement composées de processeurs CPU et d'accélérateurs (GPU, co-processeurs). L'ensemble de cette hétérogénéité doit être exploitée de manière efficace par les applications. -->

<!-- - Répartition des calculs entre CPU et co-processeurs (GPU) -->
<!-- - Exploitation efficace de calculateurs hybrides -->
<!-- - Parallélisme 'in-situ' -->

<!-- ## Méthodes particulaire avec remaillage et hybrides (méthodes particulaires semi-Lagrangienne) -->

## Simulation d'écoulements microfluidiques réactifs en milieux poreux

- Dissolution d'échantillons de roches calcaires poreuses sous l'effet
  d'un écoulement acide.
- Géométrie réelle issue de tomographie aux rayons X


## Formules de remaillage d'ordre élevé

- Analyse de formules de remaillages d'ordre spatial élevé avec splitting dimensionnel
- Utilisation de GPU pour absorber un coût arithmétique important

## Simulation de transport de scalaire passif par un écoulement turbulent à l'aide d'un solveur hybride et multi-échelle

- Utilisation de différentes échelles pour la résolution de l'écoulement (échelle grossière) et du transport de scalaire (échelle fine)
- Exploitation d'architectures différentes pour la résolution de l'écoulement (multi-CPU) et du transport de scalaire (multi-GPU)

![](https://nuage.univ-pau.fr/s/RR8LSMCaJsg4K6Z/preview)

![](https://nuage.univ-pau.fr/s/jsaQryAoWLxDjbf/preview)

# Collaborations et projets

### 2020-2024: Membre du projet ANR MucoReaDy, ANR Project Mucus, Cystic Fibrosys and Respiratory Dysfunctions,
### 2019-2023: Membre du projet MicroMineral, I-Site E2S-UPPA et Carnot Institute ISIFoR

Méthodes semi-lagrangiennes pour l’étude des processus
micrométriques réactifs du stockage minéral du CO2

### (2015-2017) CFD instationnaire autour de profils aérodynamiques (ONERA)

Optimisation et passage à l'échelle d'un code de recherche, NextFlow, développé à l'ONERA. Ce code vise à montrer la faisabilité de l'utilisation de méthodes de type LES pour la simulation d'écoulements turbulents en aéronautique dans des configurations réalistes.

- Code multi-GPU basé sur une méthode volumes finis d'ordre élevé avec reconstruction polynomiale des variables conservatives.
- Co-traitements asynchrones sur les coeurs CPU inutilisés

### (2017) Calculs d'interactions non-covalentes à partir de la densité promoléculaire (ICMR et ATOS)

Développement et optimisation sur GPU d'une méthode numérique spécifique à l'étude d'interaction ligand-protéine en vue d'une utilisation dans un algorithme générique pour l'analyse d'arrimage moléculaire.

### (2017) Portage GPU du code Yales2 (CORIA)

Étude préliminaire du portage sur GPU du code Yales2 qui est un code de simulation DNS de combustion diphasique.
