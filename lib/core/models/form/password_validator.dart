import 'package:formz/formz.dart';

enum PasswordValidatorError { invalid }

class PasswordValidator extends FormzInput<String, PasswordValidatorError> {
  const PasswordValidator.pure([String value = '']) : super.pure(value);

  const PasswordValidator.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp = RegExp(r'(?=.*[0-9a-zA-Z]).{6,}');

  @override
  PasswordValidatorError? validator(String value) {
    return _passwordRegExp.hasMatch(value)
        ? null
        : PasswordValidatorError.invalid;
  }
}
