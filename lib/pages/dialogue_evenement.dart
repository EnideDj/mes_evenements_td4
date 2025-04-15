import 'package:flutter/material.dart';
import '../modeles/evenement.dart';
import '../gestion_firestore.dart';

class DialogueEvenement {
  static Widget construireDialogue(BuildContext context, int position,
      List<Evenement> evenements) {
    final txtDescription = TextEditingController();
    final txtDate = TextEditingController();
    final txtHeureDebut = TextEditingController();
    final txtHeureFin = TextEditingController();

    if (position != -1) {
      final evenement = evenements[position];
      txtDescription.text = evenement.description;
      txtDate.text = evenement.date;
      txtHeureDebut.text = evenement.heureDebut;
      txtHeureFin.text = evenement.heureFin;
    }

    return AlertDialog(
      title: const Text('Ajouter / Modifier un événement'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: txtDescription,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            TextField(
              controller: txtDate,
              decoration: const InputDecoration(hintText: 'Date'),
            ),
            TextField(
              controller: txtHeureDebut,
              decoration: const InputDecoration(hintText: 'Heure Début'),
            ),
            TextField(
              controller: txtHeureFin,
              decoration: const InputDecoration(hintText: 'Heure Fin'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (position == -1) {
              await GestionFirestore.ajouterEvenementDansFirebase(Evenement(
                null,
                txtDescription.text,
                txtDate.text,
                txtHeureDebut.text,
                txtHeureFin.text,
                false,
              ));
            } else {
              final evenement = evenements[position];
              evenement.description = txtDescription.text;
              evenement.date = txtDate.text;
              evenement.heureDebut = txtHeureDebut.text;
              evenement.heureFin = txtHeureFin.text;

              await GestionFirestore.modifierEvenementDansFirebase(evenement);
            }
            Navigator.pop(context);
          },
          child: const Text('Enregistrer'),
        ),
      ],
    );
  }
}