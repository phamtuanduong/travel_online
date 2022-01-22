import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travelonline/core/models/models.dart';
import 'package:travelonline/core/viewmodels/auth_view_model.dart';

class FirestoreUser {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _accountCollection =
      FirebaseFirestore.instance.collection('accounts');

  addUserToFirestore(UserModel userModel, AccountModel accountModel) async {
    await _accountCollection.doc(userModel.userName).set(accountModel.toMap());
    await _usersCollection.doc(accountModel.userId).set(userModel.toMap());
    Get.find<AuthViewModel>().stopAction();
  }

  Future<DocumentSnapshot> getUserFromFirestore(String uid) async {
    return await _usersCollection.doc(uid).get();
  }

  Future<bool> checkUserNameExist(String userName) async {
    CollectionReference _account =
        FirebaseFirestore.instance.collection('accounts');
    final getAcc = await _account.doc(userName).get();
    Get.find<AuthViewModel>().stopAction();
    return getAcc.exists;
  }

  Future<DocumentSnapshot> getAccount(String userName) async {
    CollectionReference _account =
        FirebaseFirestore.instance.collection('accounts');
    final getAcc = await _account.doc(userName).get();
    Get.find<AuthViewModel>().stopAction();
    return getAcc;
  }
}
