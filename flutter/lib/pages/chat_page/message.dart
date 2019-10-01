import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Msg extends StatelessWidget {
  final String defaultUserName;
  final String txt;
  final AnimationController animationController;

  Msg({this.txt, this.animationController, this.defaultUserName});

  @override
  Widget build(BuildContext ctx) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 18.0),
              child: CircleAvatar(child: Text(defaultUserName[0])),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(defaultUserName, style: Theme.of(ctx).textTheme.subhead),
                  Container(
                    margin: const EdgeInsets.only(top: 6.0),
                    child: Text(txt),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
