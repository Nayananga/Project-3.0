/*
 * Copyright 2018 Harsh Sharma
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_3s_mobile/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  @override
  createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), _handleTapEvent);
    return Scaffold(
      body: _splashContainer(),
    );
  }

  Future<void> _handleTapEvent() async {
    if (this.mounted) {
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LogInPage()),
        );
      });
    }
  }

//------------------------------------------------------------------------------
  Widget _splashContainer() {
    return GestureDetector(
        onTap: _handleTapEvent,
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.blue[400]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    child: Image(
                  height: 200.0,
                  width: 200.0,
                  image: AssetImage("assets/images/ic_launcher.png"),
                  fit: BoxFit.fill,
                )),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Flutter Client Php Backend",
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                ),
              ],
            )));
  }
}
