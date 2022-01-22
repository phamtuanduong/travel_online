import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travelonline/core/local/local_storage_user.dart';
import 'package:travelonline/core/models/models.dart';
import 'package:travelonline/core/services/firebase_user.dart';
import 'package:travelonline/utils/extension.dart';

class AuthViewModel extends GetxController {
  String? username, email, password, name;

  final _auth = FirebaseAuth.instance;
  final Rxn<User>? _user = Rxn<User>();

  String? get user => _user?.value?.email;

  String? haveUserName, haveEmail;
  bool noFindAccount = false, isAction = false;

  @override
  void onInit() {
    super.onInit();
    _user!.bindStream(_auth.authStateChanges());
  }

  //Đăng ký bằng email, password
  void signUpWithEmailAndPassword() async {
    startAction();
    try {
      final checkUserName = await FirestoreUser().checkUserNameExist(username!);
      if (!checkUserName) {
        await _auth
            .createUserWithEmailAndPassword(email: email!, password: password!)
            .then((user) {
          saveUser(user);
          'register_success'.tr.toast();
        }).onError((error, stackTrace) {
          //print(error);
          if (error.toString().contains('email-already-in-use')) {
            haveEmail = 'have_email'.tr;
            update(['email_validator']);
          }
          'register_fail'.tr.toast(code: 1);
        });
      } else {
        haveUserName = 'have_user_name'.tr;
        update(['username_validator']);
        'register_fail'.tr.toast(code: 1);
      }

      //Get.offAll(ControlView());
    } catch (error) {
      // String errorMessage =
      //     error.toString().substring(error.toString().indexOf(' ') + 1);
      // Get.snackbar(
      //   'Failed to login..',
      //   errorMessage,
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    }
  }

  //Đăng nhập
  void signIn() async {
    if (!username!.contains('@')) {
      FirestoreUser().getAccount(username!).then((doc) {
        if (doc.exists && doc.data() != null) {
          print(doc.data());
          print(doc.data().toMap().toString());
          final account = AccountModel.fromMap(doc.data().toMap());

          email = account.email;
          signInWithEmailAndPassword(accountModel: account);
        } else {
          noFindAccount = true;
          update(['no_find_account']);
          'login_fail'.tr.toast(code: 1);
        }
      });
    } else {
      await signInWithEmailAndPassword();
    }
  }

  //Đăng nhập bằng email, password
  Future<void> signInWithEmailAndPassword({AccountModel? accountModel}) async {
    startAction();
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((user) {
        if (accountModel != null) {
          saveUserLocal(accountModel);
        } else {
          FirestoreUser().getAccount(username!).then((doc) {
            saveUserLocal(AccountModel.fromJson(doc.data().toString()));
          });
        }
        'login_success'.tr.toast();
        stopAction();
      });

      //Get.offAll(ControlView());
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      'login_fail'.tr.toast(code: 1);
      noFindAccount = false;
      update(['no_find_account']);
      errorMessage.toast();
    }
  }

  void signInWithGoogleAccount() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
      final GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();

      GoogleSignInAuthentication _googleSignInAuthentication =
          await _googleUser!.authentication;
      final _googleAuthCredential = GoogleAuthProvider.credential(
        idToken: _googleSignInAuthentication.idToken,
        accessToken: _googleSignInAuthentication.accessToken,
      );

      await _auth.signInWithCredential(_googleAuthCredential).then((user) {
        saveUser(user);
      });
      //Get.offAll(ControlView());
    } catch (error) {
      // String errorMessage =
      //     error.toString().substring(error.toString().indexOf(' ') + 1);
      // Get.snackbar(
      //   'Failed to login..',
      //   errorMessage,
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      print(error);
      'login_fail'.tr.toast(code: 1);
    }
  }

  void signInWithFacebookAccount() async {
    try {
      final _facebookSignIn = await FacebookAuth.instance.login();

      final _facebookAuthCredential =
          FacebookAuthProvider.credential(_facebookSignIn.accessToken!.token);

      await _auth.signInWithCredential(_facebookAuthCredential).then((user) {
        saveUser(user);
      });
      //Get.offAll(ControlView());
    } catch (error) {
      Get.snackbar(
        'Failed to login..',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      LocalStorageUser.clearUserData();
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  void saveUser(UserCredential userCredential) async {
    UserModel _userModel = UserModel(
      userName: username ??
          (name == null ? userCredential.user!.displayName! : name!),
      displayName: username ??
          (name == null ? userCredential.user!.displayName! : name!),
      pic: userCredential.user!.photoURL == null
          ? 'default'
          : userCredential.user!.photoURL! + "?width=400",
    );
    AccountModel _accountModel = AccountModel(
        email: userCredential.user!.email!,
        username: _userModel.userName,
        userId: userCredential.user!.uid);
    FirestoreUser().addUserToFirestore(_userModel, _accountModel);
    saveUserLocal(_accountModel);
  }

  void saveUserLocal(AccountModel userModel) async {
    LocalStorageUser.setUserData(userModel);
  }

  void startAction() {
    isAction = true;
    update(['action_loading']);
  }

  void stopAction() {
    isAction = false;
    Future.delayed(const Duration(seconds: 1))
        .whenComplete(() => update(['action_loading']));
  }
}
