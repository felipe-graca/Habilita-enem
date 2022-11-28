// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:habilita_enem/core/models/question_model.dart';

class HistoryModel {
  final QuestionModel question;
  final String subject;
  final String userRsult;
  final int questionNumber;
  HistoryModel({
    required this.question,
    required this.subject,
    required this.userRsult,
    required this.questionNumber,
  });

  HistoryModel copyWith({
    QuestionModel? question,
    String? subject,
    String? userRsult,
    int? questionNumber,
  }) {
    return HistoryModel(
      question: question ?? this.question,
      subject: subject ?? this.subject,
      userRsult: userRsult ?? this.userRsult,
      questionNumber: questionNumber ?? this.questionNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question.toMap(),
      'subject': subject,
      'userRsult': userRsult,
      'questionNumber': questionNumber,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      question: QuestionModel.fromMap(map['question'] as Map<String, dynamic>),
      subject: map['subject'] as String,
      userRsult: map['userRsult'] as String,
      questionNumber: map['questionNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) =>
      HistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HistoryModel(question: $question, subject: $subject, userRsult: $userRsult, questionNumber: $questionNumber)';
  }

  @override
  bool operator ==(covariant HistoryModel other) {
    if (identical(this, other)) return true;

    return other.question == question &&
        other.subject == subject &&
        other.userRsult == userRsult &&
        other.questionNumber == questionNumber;
  }

  @override
  int get hashCode {
    return question.hashCode ^
        subject.hashCode ^
        userRsult.hashCode ^
        questionNumber.hashCode;
  }
}
