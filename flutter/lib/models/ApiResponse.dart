import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_3s_mobile/models/User.dart';
import 'package:project_3s_mobile/utils/app_shared_preferences.dart';

class ApiResponce {
  handleLoginResponse(http.Response response) {
    if (response.statusCode == 200) {
      final _responseData = jsonDecode(response.body);
      print(_responseData['message']['Logged_User_Id']);
      final String _googleId = _responseData['message']['Logged_User_Id'];
      final String _nickname = _responseData['message']['Logged_User_Name'];
      final User _user = User(
          googleId: _googleId,
          email: '',
          nickname: _nickname,
          image: '',
          phoneNo: '',
          nic: '');
      AppSharedPreferences.setUserProfile(_user);
    } else {
      throw new Exception(response.statusCode);
    }
  }

  handleCreateReviewResponse(http.Response response) {
    if (response.statusCode == 200) {
      final _responseData = jsonDecode(response.body);
      print(_responseData['message']['Create_Review_Status']);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
