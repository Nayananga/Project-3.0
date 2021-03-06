import 'package:flutter/material.dart';
import 'package:project_3s_mobile/models/entities/answer.dart';
import 'package:project_3s_mobile/models/entities/quiz.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class Selections extends StatelessWidget {
  const Selections({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: model.quiz.answers
          .map((option) => _buildButton(
                context,
                option: option,
                currentQuiz: model.quiz,
              ))
          .toList(),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    @required String option,
    @required Quiz currentQuiz,
  }) {
    final model = Provider.of<Model>(context);
    final currentAnswer = model.currentAnswer;
    return RaisedButton(
      child: Text(option),
      color: currentAnswer == null
          ? null
          : currentAnswer.answer == option ? Colors.green : null,
      onPressed: () {
        final Answer currentAnswer =
            Answer(question: currentQuiz.question, answer: option);
        model.answer(currentAnswer);
      },
    );
  }
}
