import 'package:flutter/material.dart';
import 'package:project_3s_mobile/models/model.dart';

import 'model.dart';

class Question extends StatelessWidget {
  const Question({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    final quiz = model.quiz;
    return Text(
      quiz.correct.description,
      style: Theme.of(context).textTheme.headline,
    );
  }
}
