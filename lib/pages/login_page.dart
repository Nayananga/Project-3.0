// Copyright 2019 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
// import 'package:project_3s_mobile/models/ApiRequest.dart'; 
// import 'package:project_3s_mobile/models/ApiResponse.dart';
import 'package:project_3s_mobile/pages/chat_page.dart';
import 'package:project_3s_mobile/pages/complaint_page.dart';
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
          backgroundColor: new Color(0xffde5cbc),
          title: const Text('Google Sign In'),
        ),
        body: Container(
            decoration: BoxDecoration(
              color:new Color (0xff622F74),
               gradient:LinearGradient(
                 colors: [new Color (0xff6094e8),new Color(0xffde5cbc)],
                     begin:Alignment.centerRight,
                       end:Alignment.centerLeft, 
              )
              ),

          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: _buildBody(),
     ),
        ) 
     );
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
           const Text("Signed in successfull.",
           textAlign: TextAlign.left,
           style: TextStyle(
           color:Colors.white,
            fontSize: 20.0
          ),
          ),


      ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
             child: RaisedButton(
                shape:StadiumBorder(),
                color:Colors.purpleAccent,
                child: const Text('Lets Chat',
                style: TextStyle(
                  fontSize:20.0,
                   color:Colors.white ),),
                  onPressed: _goToChatPage,
              ),),

    ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
             child: RaisedButton(
              shape:StadiumBorder(),
            color:Colors.purpleAccent,
            child: const Text(' Surey ',
            style: TextStyle(
              fontSize:20.0,
               color:Colors.white ),
            ),
            onPressed: _goToQuizPage,
          )),

    ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
          child:RaisedButton(
              shape:StadiumBorder(),
            color:Colors.purpleAccent,
            child: const Text('Complaint',
            style: TextStyle(
              fontSize:20.0,
               color:Colors.white ),
            ),
            onPressed: _goToComplaintPage,
          ),),
        
        ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
          child: RaisedButton(
            color:Colors.purpleAccent,
            shape:StadiumBorder(),
            child: const Text('SIGN OUT',
            style: TextStyle( 
              fontSize: 20.0,
              color: Colors.white,),
            ),
            onPressed: _handleSignOut,
          ))
        ],
      );
    } 
    else {
      return Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("You are not currently signed in.",
          style: TextStyle(
            fontSize: 20.0
          ),),
     SizedBox(
    height: 30.0,
  ),
      ButtonTheme(
        minWidth: 150.0,
        height: 50.0,
         child:RaisedButton(
              color:Colors.purpleAccent,
              shape:StadiumBorder(),
              onPressed: _handleSignIn,
              child: const Text('SIGN IN',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                )),
            ))
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

_goToComplaintPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ComplaintPage()),
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
            ApiResponce().handleLoginResponse(response);
    }
  }
            
   ApiResponce() {}
        
        class ApiRequest {
      apiPostRequest(String url, String body) {}
}
