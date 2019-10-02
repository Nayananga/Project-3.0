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
//import 'package:project_3s_mobile/pages/ui_design.dart';


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
           // decoration: __new Uidecoration(),
            decoration: BoxDecoration(
                color: new Color(0xff622F74),
                gradient: LinearGradient(
                  colors: [new Color(0xff6094e8), new Color(0xffde5cbc)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                )),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Image(
                    height: 300.0,
                    width: 300.0,
                    image: AssetImage("assets/images/download.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Hotel Reviewer",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )));
  }
}
