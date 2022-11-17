import 'package:formz/formz.dart';

enum EmailValidatorError { invalid }

class EmailValidator extends FormzInput<String, EmailValidatorError> {
  const EmailValidator.pure([String value = '']) : super.pure(value);

  const EmailValidator.dirty([String value = '']) : super.dirty(value);

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidatorError? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : EmailValidatorError.invalid;
  }
}
