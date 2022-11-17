import 'package:formz/formz.dart';

enum NameValidatorError { invalid }

class NameValidator extends FormzInput<String, NameValidatorError> {
  const NameValidator.pure([String value = '']) : super.pure(value);

  const NameValidator.dirty([String value = '']) : super.dirty(value);

  static final _nameRegExp = RegExp(r'^[A-Za-z\s]{3,}$');

  @override
  NameValidatorError? validator(String? value) {
    return _nameRegExp.hasMatch(value ?? '')
        ? null
        : NameValidatorError.invalid;
  }
}
