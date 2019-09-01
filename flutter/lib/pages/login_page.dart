// Copyright 2019 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert' show json;
import "package:http/http.dart" as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';
import 'package:project_3s_mobile/customviews/progress_dialog.dart';
import 'package:project_3s_mobile/futures/app_futures.dart';
import 'package:project_3s_mobile/models/base/EventObject.dart';
import 'package:project_3s_mobile/pages/home_page.dart';
import 'package:project_3s_mobile/utils/app_shared_preferences.dart';
import 'package:project_3s_mobile/utils/constants.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'https://www.googleapis.com/auth/userinfo.profile',
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/user.phonenumbers.read',
    'https://www.googleapis.com/auth/contacts.readonly'
  ],
);

class SignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();
}

class SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount _currentUser;
  String _contactText, idToken;  //TODO:NO NEED

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleSignInCredential();
        _handleGetContact();  //TODO:NO NEED
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
          child: _buildBody(),  //TODO:NEED TO MOVE INTO HOMEPAGE
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
          Text(_contactText ?? ''), //TODO:NO NEED
          RaisedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
          RaisedButton(
            child: const Text('REFRESH'),
            onPressed: _handleGetContact, //TODO:NO NEED
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

  Future<void> _handleGetContact() async {  //TODO:NO NEED
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get( // request phoneNumber
      'https://people.googleapis.com/v1/people/me'
          '?personFields=phoneNumbers',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) { // get phoneNumber
    final List<dynamic> phoneNumbers = data['phoneNumbers'];
    final Map<String, dynamic> phoneNumber = phoneNumbers?.firstWhere(
          (dynamic phoneNumber) => phoneNumber['value'] != null,
      orElse: () => null,
    );
    if (phoneNumber != null) {
      return phoneNumber['value'];
    }
    return null;
  }

  Future<void> _handleSignInCredential() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//    final AuthCredential credential = GoogleAuthProvider.getCredential(
//      accessToken: googleAuth.accessToken,
//      idToken: googleAuth.idToken,
//    );

    idToken = googleAuth.idToken;
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