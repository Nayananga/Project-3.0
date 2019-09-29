import 'package:meta/meta.dart';

class Quiz {
  final String question;

  final List<String> answers;

  Quiz({
    @required this.question,
    @required this.answers,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    final answersFromJson = json['answers'];
    List<String> answersList = new List<String>.from(answersFromJson);
    return new Quiz(
      question: json['description'] as String,
      answers: answersList,
    );
  }
}
