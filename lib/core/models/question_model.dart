// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuestionModel {
  final String text;
  final String aResult;
  final String bResult;
  final String cResult;
  final String dResult;
  final String eResult;
  final String result;
  QuestionModel({
    required this.text,
    required this.aResult,
    required this.bResult,
    required this.cResult,
    required this.dResult,
    required this.eResult,
    required this.result,
  });

  QuestionModel copyWith({
    String? text,
    String? aResult,
    String? bResult,
    String? cResult,
    String? dResult,
    String? eResult,
    String? result,
  }) {
    return QuestionModel(
      text: text ?? this.text,
      aResult: aResult ?? this.aResult,
      bResult: bResult ?? this.bResult,
      cResult: cResult ?? this.cResult,
      dResult: dResult ?? this.dResult,
      eResult: eResult ?? this.eResult,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'aResult': aResult,
      'bResult': bResult,
      'cResult': cResult,
      'dResult': dResult,
      'eResult': eResult,
      'result': result,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      text: map['text'] as String,
      aResult: map['aResult'] as String,
      bResult: map['bResult'] as String,
      cResult: map['cResult'] as String,
      dResult: map['dResult'] as String,
      eResult: map['eResult'] as String,
      result: map['result'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuestionModel(text: $text, aResult: $aResult, bResult: $bResult, cResult: $cResult, dResult: $dResult, eResult: $eResult, result: $result)';
  }

  @override
  bool operator ==(covariant QuestionModel other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.aResult == aResult &&
        other.bResult == bResult &&
        other.cResult == cResult &&
        other.dResult == dResult &&
        other.eResult == eResult &&
        other.result == result;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        aResult.hashCode ^
        bResult.hashCode ^
        cResult.hashCode ^
        dResult.hashCode ^
        eResult.hashCode ^
        result.hashCode;
  }
}
