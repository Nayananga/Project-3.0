// Copyright 2019 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:project_3s_mobile/pages/home_page.dart';
import 'package:project_3s_mobile/utils/constants.dart';
import 'package:project_3s_mobile/models/ApiRequest.dart';


final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'https://www.googleapis.com/auth/userinfo.profile',
    'https://www.googleapis.com/auth/userinfo.email',
  ],
);

class SignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();
}

class SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount _currentUser;
  String idToken;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleSignInCredential();
      }
    });
    _googleSignIn.signInSilently();
  }

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

  Future<void> _handleSignInCredential() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    idToken = googleAuth.idToken;
    printWrapped(idToken);
    _sendCredential();
  }

  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  Future<void> _sendCredential() async {
    String url = APIConstants.API_BASE_URL + APIRoutes.LOGIN_USER;
    var body = json.encode('');
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: idToken,
    };
    try {
      await apiRequest('post',url, headers, body);
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
  }

  void _goToHomeScreen() {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => new HomePage()),
    );
  }

//  Widget _appIcon() {
//    return new Container(
//      decoration: new BoxDecoration(color: Colors.blue[400]),
//      child: new Image(
//        image: new AssetImage("assets/images/ic_launcher.png"),
//        height: 170.0,
//        width: 170.0,
//      ),
//      margin: EdgeInsets.only(top: 20.0),
//    );
//  }
}

//class LoginPageState extends State<LoginPage> {
//  final globalKey = new GlobalKey<ScaffoldState>();

////------------------------------------------------------------------------------
//  void _loginUser(String id, String password) async {
//    EventObject eventObject = await loginUser(id, password);
//    switch (eventObject.id) {
//      case EventConstants.LOGIN_USER_SUCCESSFUL:
//        {
//          setState(() {
//            AppSharedPreferences.setUserLoggedIn(true);
//            AppSharedPreferences.setUserProfile(eventObject.object);
//            globalKey.currentState.showSnackBar(new SnackBar(
//              content: new Text(SnackBarText.LOGIN_SUCCESSFUL),
//            ));
//            progressDialog.hideProgress();
//            _goToHomeScreen();
//          });
//        }
//        break;
//      case EventConstants.LOGIN_USER_UN_SUCCESSFUL:
//        {
//          setState(() {
//            globalKey.currentState.showSnackBar(new SnackBar(
//              content: new Text(SnackBarText.LOGIN_UN_SUCCESSFUL),
//            ));
//            progressDialog.hideProgress();
//          });
//        }
//        break;
//      case EventConstants.NO_INTERNET_CONNECTION:
//        {
//          setState(() {
//            globalKey.currentState.showSnackBar(new SnackBar(
//              content: new Text(SnackBarText.NO_INTERNET_CONNECTION),
//            ));
//            progressDialog.hideProgress();
//          });
//        }
//        break;
//    }
//  }
//}