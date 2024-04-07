import 'message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageBdd {

  List<Message> _messageListFromSnapshot(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return _messageFromSnapshot(doc);
    }).toList();
  }

  Message _messageFromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("Ce message n'existe pas");
    return Message(
      firstName: data['firstName'],
      lastName: data['lastName'],
      timeStamp: data['timeStamp'],
      content: data['content'],
    );
  }

  Stream<List<Message>> getMessage(String nom_doc, int limit) {
    return FirebaseFirestore.instance
        .collection('messages')
        .doc(nom_doc)
        .collection(nom_doc)
        .orderBy('timeStamp', descending: true)
        .limit(limit)
        .snapshots()
        .map(_messageListFromSnapshot);
  }

  void onSendMessage(Message message) {
    var docRef = FirebaseFirestore.instance
        .collection('messages')
        .doc('APTRLTenucm19S4qvzNh')
        .collection('APTRLTenucm19S4qvzNh')
        .doc();

    message.timeStamp = Timestamp.now();

    docRef.set(message.toHashMap());
  }
}

