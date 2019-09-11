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
  createState() => new SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final globalKey = new GlobalKey<ScaffoldState>();
//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 3), _handleTapEvent);
    return new Scaffold(
      key: globalKey,
      body: _splashContainer(),
    );
  }
//------------------------------------------------------------------------------
  Widget _splashContainer() {
    return GestureDetector(
        onTap: _handleTapEvent,
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: new BoxDecoration(color: Colors.blue[400]),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Container(
                    child: new Image(
                  height: 200.0,
                  width: 200.0,
                  image: new AssetImage("assets/images/ic_launcher.png"),
                  fit: BoxFit.fill,
                )),
                new Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: new Text(
                    "Flutter Client Php Backend",
                    style: new TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                ),
              ],
            )));
  }
//------------------------------------------------------------------------------
  Future<void> _handleTapEvent() async {
    if (this.mounted) {
      setState(() {
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(builder: (context) => new SignInDemo()),
          );
      });
    }
  }
}
