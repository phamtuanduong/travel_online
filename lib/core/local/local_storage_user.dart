import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelonline/core/models/models.dart';

class LocalStorageUser {
  static setUserData(AccountModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('account', json.encode(userModel.toJson()));
  }

  static Future<AccountModel> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return AccountModel.fromJson(json.decode(prefs.getString('acoount')!));
  }

  static clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
