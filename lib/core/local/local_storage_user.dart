import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelonline/core/models/models.dart';

class LocalStorageUser {
  static setUserData(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', json.encode(userModel.toJson()));
  }

  static Future<UserModel> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return UserModel.fromJson(json.decode(prefs.getString('user')!));
  }

  static clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
