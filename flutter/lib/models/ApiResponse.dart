import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_3s_mobile/models/entities/User.dart';
import 'package:project_3s_mobile/utils/app_shared_preferences.dart';

class ApiResponse {
  handleCreateReviewResponse(http.Response response) {
    if (response.statusCode == 200) {
      final _responseData = jsonDecode(response.body);
      print(_responseData['message']['id']);
    } else {
      throw Exception(response.statusCode);
    }
  }

  handleLoginResponse(http.Response response) {
    if (response.statusCode == 200) {
      final _responseData = jsonDecode(response.body);
      print(_responseData);
      final String _googleId = _responseData['message']['google_id'];
      final String _nickname = _responseData['message']['nickname'];
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
}
