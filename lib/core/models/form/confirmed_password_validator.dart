import 'package:formz/formz.dart';

enum ConfirmedPasswordValidatorError {
  invalid,
  mismatch,
}

class ConfirmedPasswordValidator
    extends FormzInput<String, ConfirmedPasswordValidatorError> {
  final String password;

  const ConfirmedPasswordValidator.pure({this.password = ''}) : super.pure('');

  const ConfirmedPasswordValidator.dirty(
      {required this.password, String value = ''})
      : super.dirty(value);

  @override
  ConfirmedPasswordValidatorError? validator(String value) {
    if (value.isEmpty) {
      return ConfirmedPasswordValidatorError.invalid;
    }
    return password == value ? null : ConfirmedPasswordValidatorError.mismatch;
  }
}
