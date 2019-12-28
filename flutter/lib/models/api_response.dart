import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_3s_mobile/models/entities/user.dart';

class ApiResponse {
  handleCreateReviewResponse(http.Response response) {
    if (response.statusCode == 200) {
      final _responseData = jsonDecode(response.body);
      print(_responseData['message']['id']);
    } else {
      print(response.statusCode);
    }
  }

  User handleGetOneUserResponse(http.Response response) {
    User _user;
    if (response.statusCode == 200) {
      final _responseData = jsonDecode(response.body);
      print(_responseData);
      _user = User(
          googleId: _responseData['message']['google_id'],
          email: _responseData['message']['email'],
          nickname: _responseData['message']['nickname'],
          image: '',
          phoneNo: _responseData['message']['phoneNo'],
          nic: _responseData['message']['nic']);
      return _user;
    } else {
      print(response.statusCode);
      throw new Exception("Error getting user data");
    }
  }

  bool handleLoginResponse(http.Response response) {
    if (response.statusCode == 200) {
      final _responseData = jsonDecode(response.body);
      print(_responseData);
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }

  dynamic handleQuestionsResponse(http.Response response) {
    if (response.statusCode == 200) {
      final _responseData = jsonDecode(response.body);
      print(_responseData['message']);
      return _responseData['message'];
    } else {
      print(response.statusCode);
      return null;
    }
  }

  List handleSearchResponse(http.Response response) {
    if (response.statusCode == 200) {
      final _responseData = jsonDecode(response.body);
      return _responseData['message'];
    } else {
      print(response.statusCode);
      throw new Exception("Error getting hotel data");
    }
  }
}
