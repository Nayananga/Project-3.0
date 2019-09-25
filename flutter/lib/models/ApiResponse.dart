import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_3s_mobile/models/User.dart';
import 'package:project_3s_mobile/utils/app_shared_preferences.dart';

class ApiResponce {
  handleLoginResponse(http.Response response) {
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print(responseData['message']['Logged_User_Id']);
      final String googleId = responseData['message']['Logged_User_Id'];
      final String nickname = responseData['message']['Logged_User_Name'];
      final User user = User(
          googleId: googleId,
          email: '',
          nickname: nickname,
          image: '',
          phoneNo: '',
          nic: '');
      AppSharedPreferences.setUserProfile(user);
    } else {
      throw new Exception(response.statusCode);
    }
  }

  handleReviewResponse(http.Response response) {
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final String googleId = responseData['message']['Logged_User_Id'];
      final String nickname = responseData['message']['Logged_User_Name'];
      final User user = User(
          googleId: googleId,
          email: '',
          nickname: nickname,
          image: '',
          phoneNo: '',
          nic: '');
      AppSharedPreferences.setUserProfile(user);
      print(responseData['message']['Logged_User_Id']);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
