import 'package:flutter/material.dart';


class DecorationPage extends StatefulWidget {
  @override
  Uidecoration createState() => new Uidecoration();
}

class Uidecoration extends State<DecorationPage> with SingleTickerProviderStateMixin{
    AnimationController progressController ;
    Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
            backgroundColor: new Color(0xffde5cbc),
        ),
      body: Container(
        decoration: BoxDecoration(
              color: new Color(0xff622F74),
              gradient: LinearGradient(
                colors: [new Color(0xff6094e8), new Color(0xffde5cbc)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              )),
      )
    );
  }
   
}