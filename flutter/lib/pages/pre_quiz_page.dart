import 'package:flutter/material.dart';
import 'package:project_3s_mobile/models/entities/hotel.dart';
import 'package:project_3s_mobile/models/quiz_loader.dart';
import 'package:project_3s_mobile/pages/quiz_page/quiz_page.dart';
import 'package:provider/provider.dart';

class PreQuizPage extends StatelessWidget {
  final Hotel selectedHotel;

  const PreQuizPage({Key key, this.selectedHotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: QuizLoader()),
      ],
      child: Scaffold(
        body: QuizPage(selectedHotel),
      ),
    );
  }
}
