import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Settings extends State<SettingsPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xffde5cbc),
        title: Text("Settings"),
        elevation: Theme.of(ctx).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: new Color(0xff622F74),
          gradient: LinearGradient(
            colors: [new Color(0xff6094e8), new Color(0xffde5cbc)],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  State createState() => Settings();
}
