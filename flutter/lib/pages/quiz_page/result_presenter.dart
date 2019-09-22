import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model.dart';

class ResultPresenter {
  void show(
    BuildContext context, {
    @required Model model,
    @required bool answerStatus,
  }) {
    showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: SizedBox(
              height: 60,
              child: FlareActor(
                'assets/animation/${'success'}.flr',
                animation: 's',
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'You\`re awesome!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Just few more'),
              ],
            ),
            actions: [
              FlatButton(
                child: const Text('Go Back'),
                onPressed: () => null,
              ),
              FlatButton(
                child: const Text('NEXT'),
                onPressed: () {
                  model.next();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
