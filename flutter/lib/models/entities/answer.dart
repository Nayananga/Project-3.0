import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'answer.g.dart';

@JsonSerializable()
class Answer {
  final String question;

  final String answer;

  Answer({
    @required this.question,
    @required this.answer,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
