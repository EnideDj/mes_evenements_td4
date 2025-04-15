import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../gestion_firestore.dart';
import '../modeles/evenement.dart';
import 'dialogue_evenement.dart';

class PageEvenements extends StatefulWidget {
  final String utilisateur;
  const PageEvenements({required this.utilisateur, Key? key}) : super(key: key);

  @override
  State<PageEvenements> createState() => _PageEvenementsState();
}

class _PageEvenementsState extends State<PageEvenements> {
  late Future<List<Evenement>> _evenementsFuture;

  @override
  void initState() {
    super.initState();
    _evenementsFuture = GestionFirestore.lireListeEvenements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Événements'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: FutureBuilder<List<Evenement>>(
        future: _evenementsFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List<Evenement> evenements = snapshot.data!;

          return ListView.builder(
            itemCount: evenements.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(evenements[index].description),
                subtitle: Text(
                    '${evenements[index].date} | ${evenements[index].heureDebut} - ${evenements[index].heureFin}'),
                trailing: IconButton(
                  icon: Icon(
                    Icons.star,
                    color: evenements[index].estFavori
                        ? Colors.amber
                        : Colors.grey,
                  ),
                  onPressed: () async {
                    setState(() {
                      evenements[index].estFavori =
                      !evenements[index].estFavori;
                    });
                    await GestionFirestore.modifierEvenementDansFirebase(
                        evenements[index]);
                  },
                ),
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => DialogueEvenement.construireDialogue(
                        context, index, evenements),
                  ).then((_) {
                    setState(() {
                      _evenementsFuture =
                          GestionFirestore.lireListeEvenements();
                    });
                  });
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) =>
                DialogueEvenement.construireDialogue(context, -1, []),
          ).then((_) {
            setState(() {
              _evenementsFuture = GestionFirestore.lireListeEvenements();
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}