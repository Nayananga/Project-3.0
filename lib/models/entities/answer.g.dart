// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
      question: json['question'] as String, answer: json['answer'] as String);
}

Map<String, dynamic> _$AnswerToJson(Answer instance) =>
    <String, dynamic>{'question': instance.question, 'answer': instance.answer};