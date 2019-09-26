import 'dart:async';
import 'dart:convert';

import 'package:project_3s_mobile/models/entities/User.dart';
import 'package:project_3s_mobile/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
///////////////////////////////////////////////////////////////////////////////
  static Future<void> clear() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
    } catch (error) {
      print(error);
    }
  }

///////////////////////////////////////////////////////////////////////////////
  static Future<String> getUserLoggedIdToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(SharedPreferenceKeys.USER_LOGGED_ID_TOKEN);
    } catch (error) {
      print(error);
      return null;
    }
  }

  ///////////////////////////////////////////////////////////////////////////////
  static Future<User> getUserProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return User.fromJson(
          json.decode(prefs.getString(SharedPreferenceKeys.USER)));
    } catch (error) {
      print(error);
      return null;
    }
  }

  static Future<void> setUserLoggedIdToken(String idToken) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setString(
          SharedPreferenceKeys.USER_LOGGED_ID_TOKEN, idToken);
    } catch (error) {
      print(error);
    }
  }

  static Future<void> setUserProfile(User user) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String userProfileJson = json.encode(user);
      prefs.setString(SharedPreferenceKeys.USER, userProfileJson);
    } catch (error) {
      print(error);
    }
  }
}
