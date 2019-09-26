import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:project_3s_mobile/models/ApiRequest.dart';
import 'package:project_3s_mobile/models/ApiResponse.dart';
import 'package:project_3s_mobile/pages/chat_page.dart';
import 'package:project_3s_mobile/pages/pre_quiz_page.dart';
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
  State createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  GoogleSignInAccount _currentUser;

  @override
  Widget build(BuildContext context) {
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
    try {
      _googleSignIn.signInSilently();
    } catch (error) {
      print(error);
    }
  }

  Widget _buildBody() {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          RaisedButton(
            child: const Text('Lets Chat'),
            onPressed: _goToChatPage,
          ),
          RaisedButton(
            child: const Text('Survey'),
            onPressed: _goToQuizPage,
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
        children: [
          const Text("You are not currently signed in."),
          RaisedButton(
            child: const Text('SIGN IN'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  _goToChatPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatPage()),
    );
  }

  _goToQuizPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PreQuizPage()),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignInCredential() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      AppSharedPreferences.setUserLoggedIdToken(googleAuth.idToken);
      _sendCredential();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
    AppSharedPreferences.clear();
  }

  Future<void> _sendCredential() async {
    const String url = APIConstants.API_BASE_URL + APIRoutes.LOGIN_USER;
    final body = jsonEncode('');
    http.Response response = await ApiRequest().apiPostRequest(url, body);
    ApiResponse().handleLoginResponse(response);
  }
}
