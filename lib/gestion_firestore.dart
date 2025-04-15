import 'package:cloud_firestore/cloud_firestore.dart';
import 'modeles/evenement.dart';

class GestionFirestore {
  static Future<List<Evenement>> lireListeEvenements() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection(Evenement.NOM_COLLECTION_EVENEMENT)
        .get();

    return snapshot.docs
        .map((doc) =>
        Evenement.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  static Future<void> ajouterEvenementDansFirebase(Evenement evenement) async {
    await FirebaseFirestore.instance
        .collection(Evenement.NOM_COLLECTION_EVENEMENT)
        .add(evenement.toMap());
  }

  static Future<void> modifierEvenementDansFirebase(Evenement evenement) async {
    await FirebaseFirestore.instance
        .collection(Evenement.NOM_COLLECTION_EVENEMENT)
        .doc(evenement.id)
        .update(evenement.toMap());
  }

  static Future<void> supprimerEvenementDansFirebase(Evenement evenement) async {
    await FirebaseFirestore.instance
        .collection(Evenement.NOM_COLLECTION_EVENEMENT)
        .doc(evenement.id)
        .delete();
  }
}