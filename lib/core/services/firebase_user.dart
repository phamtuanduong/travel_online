import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelonline/core/models/models.dart';

class FirestoreUser {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  addUserToFirestore(UserModel userModel) async {
    await _usersCollection.doc(userModel.userId).set(userModel.toJson());
  }

  Future<DocumentSnapshot> getUserFromFirestore(String uid) async {
    return await _usersCollection.doc(uid).get();
  }
}
