import 'dart:convert';

import 'package:flutter/services.dart';

import 'entities/entities.dart';

class QuizLoader {
  Future<List<Quiz>> load() async {
    final quizzes =
        (jsonDecode(await rootBundle.loadString('assets/data/widgets.json'))
                as List)
            .map<Quiz>(
                (dynamic json) => Quiz.fromJson(json as Map<String, dynamic>))
            .toList();
    return (quizzes..shuffle());
  }
}
