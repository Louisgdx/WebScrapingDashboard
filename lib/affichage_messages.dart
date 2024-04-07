import 'package:flutter/material.dart';
import 'colors.dart';
import 'marge_gauche.dart';
import '/data/message.dart';
import '/data/message-bdd.dart';

// Classe AffichageMessages
class AffichageMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
      stream: MessageBdd().getMessage('Ali Baba', 10),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        List<Message> messages = snapshot.data!;

        return Dialog(
          // Contenu de la fenêtre modale pour afficher les messages
          // Vous pouvez personnaliser selon vos besoins
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 10, // Hauteur du rectangle
                  decoration: BoxDecoration(
                    gradient: AppColors().gradient, // Dégradé de couleurs
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  alignment: Alignment.center, // Alignement du texte au centre
                  child: Text(
                    'Messagerie', // Titre de la fenêtre modale
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors().grisFonce,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Liste des messages
                messages.isEmpty
                    ? Center(
                  child: Text(
                    'Aucune conversation', // Affichage si aucune conversation
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
                    : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(messages[index].content),
                        subtitle: Text(messages[index].timeStamp.toString()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                // Bouton "Composer un message" centré horizontalement
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      _composerMessage(context); // Ouvre la page de composition de messages
                    },
                    child: Text('Nouveau Message'), // Remplace le texte par "Nouveau Message"
                  ),
                ),
                Spacer(), // Pour pousser le bouton "Fermer" vers le bas
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Fermer la fenêtre modale
                    },
                    child: Text('Fermer'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Méthode pour ouvrir la page de composition de messages
  void _composerMessage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ComposerMessagePage(),
      ),
    );
  }
}


// Classe Composer Messages
class ComposerMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Composer un message'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Destinataire'),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Taper le message'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logique pour envoyer le message
              },
              child: Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }
}
