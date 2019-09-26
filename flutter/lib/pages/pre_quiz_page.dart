import 'package:flutter/material.dart';
import 'package:project_3s_mobile/models/quiz_loader.dart';
import 'package:project_3s_mobile/pages/quiz_page/quiz_page.dart';
import 'package:provider/provider.dart';

class PreQuizPage extends StatelessWidget {
  const PreQuizPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: QuizLoader()),
      ],
      child: Scaffold(
        body: QuizPage(),
      ),
    );
  }
}
