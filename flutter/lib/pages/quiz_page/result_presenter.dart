import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'model.dart';

class ResultPresenter {
  show(
    BuildContext context, {
    @required Model model,
    @required bool isLast,
  }) {
    showDialog<void>(
        context: context,
        builder: (context) {
          ProgressDialog pr =
              new ProgressDialog(context, type: ProgressDialogType.Normal);
          pr.style(
            message: 'Uploading answers..',
            backgroundColor: Colors.white30,
          );
          if (isLast) {
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
                    'Thank You!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('You made it'),
                ],
              ),
              actions: [
                FlatButton(
                  child: const Text('Go Back'),
                  onPressed: () =>
                      Navigator.of(context).popUntil((route) => route.isFirst),
                ),
                FlatButton(
                  child: const Text('Submit'),
                  onPressed: () async {
                    pr.show();
                    await model.next();
                    pr.hide();
                    Navigator.of(context)
                        .popUntil((route) => route.isFirst); // need to submit
                  },
                )
              ],
            );
          } else {
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
                  onPressed: () =>
                      Navigator.of(context).popUntil((route) => route.isFirst),
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
          }
        });
  }
}
