// Copyright 2019 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:project_3s_mobile/models/ApiRequest.dart';
import 'package:project_3s_mobile/models/User.dart';
import 'package:project_3s_mobile/pages/chat_page.dart';
import 'package:project_3s_mobile/utils/app_shared_preferences.dart';
import 'package:project_3s_mobile/utils/constants.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'https://www.googleapis.com/auth/userinfo.profile',
    'https://www.googleapis.com/auth/userinfo.email',
  ],
);

class LogInPage extends StatefulWidget {
  @override
  State createState() => LogInPageState();
}

class LogInPageState extends State<LogInPage> {
  ProgressDialog pr;
  GoogleSignInAccount _currentUser;

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context, ProgressDialogType.Normal);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }

  @override
  initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
        _handleSignInCredential();
      });
    });
    _googleSignIn.signInSilently();
  }

  // to print idToken in console
  printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  Widget _buildBody() {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          RaisedButton(
            child: const Text('Lets Chat'),
            onPressed: _goToChatScreen,
          ),
          const Text("Signed in successfully."),
          RaisedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("You are not currently signed in."),
          RaisedButton(
            child: const Text('SIGN IN'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  _goToChatScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatPage()),
    );
  }

  _handleResponce(http.Response response) {
    var responseData = jsonDecode(response.body);
    print(responseData['message']['Logged_User_Id']);
    String googleId = responseData['message']['Logged_User_Id'];
    String nickname = responseData['message']['Logged_User_Name'];
    User user = User(
        googleId: googleId,
        email: '',
        nickname: nickname,
        image: '',
        phoneNo: '',
        nic: '');
    AppSharedPreferences.setUserProfile(user);
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignInCredential() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final idToken = googleAuth.idToken;
    printWrapped(idToken);
    _sendCredential(idToken);
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
    AppSharedPreferences.clear();
  }

  Future<void> _sendCredential(String idToken) async {
    String url = APIConstants.API_BASE_URL + APIRoutes.LOGIN_USER;
    var body = jsonEncode('');
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: idToken,
    };
    http.Response response = await apiRequest('post', url, headers, body);
    _handleResponce(response);
  }
}
