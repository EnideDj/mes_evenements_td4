# Jouons à Pong - TP N°3

## Description

Ce projet est une application mobile Flutter permettant de gérer des événements personnels.
L’application utilise Firebase (Firestore + Authentification) pour stocker les données et gérer les utilisateurs.

### L’utilisateur peut :
- S’authentifier (connexion / inscription par email et mot de passe)
- Voir la liste des événements stockés dans Firestore
- Ajouter, modifier, supprimer des événements
- Marquer ses événements favoris
- Visualiser ses événements de manière dynamique et interactive
### Fonctionnalités principales :
- Authentification Firebase (Email / Mot de passe)
- Affichage de la liste des événements depuis Firestore
- Ajouter un événement via une boîte de dialogue
- Modifier un événement (appui long)
- Supprimer un événement (Swipe / Dismissible)
- Marquer un événement en favori (icône étoile)
- Données synchronisées en temps réel avec Firestore
- Interface simple, responsive et facile d’utilisation
---

## Structure du projet

```env
├── lib/
│   ├── main.dart                   # Point d’entrée de l’application
│   ├── gestion_firestore.dart      # Gestion des opérations CRUD avec Firestore
│   ├── modeles/
│   │   └── evenement.dart          # Modèle de données Evenement
│   ├── pages/
│   │   ├── page_connexion.dart     # Page de connexion et inscription
│   │   ├── page_evenements.dart    # Page affichant la liste des événements
│   │   └── dialogue_evenement.dart # Boîte de dialogue pour ajouter/modifier un événement
│   └── firebase_options.dart       # Configuration Firebase (auto-générée)
├── pubspec.yaml                    # Dépendances et configuration Flutter
```
## Installation

1. **Clonez le projet** :

```bash
git clone https://github.com/EnideDj/mes_evenements_tp4
```
2.	Installez les dépendances :
```bash
flutter pub get
```
3.	Exécutez l’application :
      Pour exécuter l’application sur un émulateur ou un appareil physique, utilisez la commande suivante :
```bash
flutter run
```

## ENIDE DJENDER - FISA-TI-27 - IMT NORD EUROPE
