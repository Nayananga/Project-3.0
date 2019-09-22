import 'dart:convert';

import 'package:flutter/services.dart';

import 'entities/entities.dart';

class QuizLoader {
  Future<List<Quiz>> load() async {
    final quizes = (jsonDecode(
            await rootBundle.loadString('assets/data/widgets.json')) as List)
        .map<Quiz>(
            (dynamic json) => Quiz.fromJson(json as Map<String, dynamic>))
        .toList();
    return (quizes..shuffle())
        .sublist(0, 10);
  }
}
