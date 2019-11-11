import 'package:meta/meta.dart';

class Quiz {
  final String question;

  final List<String> answers;

  Quiz({
    @required this.question,
    @required this.answers,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    final String answersFromJson = json['expected_answer']; 
    List<String> answersList = answersFromJson
        .substring(1, answersFromJson.length - 1)
        .replaceAll('"', '')
        .split(',');
    return new Quiz(
      question: json['question'] as String,
      answers: answersList,
    );
  }
}
