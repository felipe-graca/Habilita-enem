import 'package:formz/formz.dart';

enum TextFormValidatorError { invalid }

class TextValidator extends FormzInput<String, TextFormValidatorError> {
  final bool optional;

  const TextValidator.pure({String value = '', this.optional = false})
      : super.pure(value);

  const TextValidator.dirty({String value = '', this.optional = false})
      : super.dirty(value);

  @override
  TextFormValidatorError? validator(String? value) {
    if (optional) {
      return null;
    }

    return (value ?? '').isNotEmpty ? null : TextFormValidatorError.invalid;
  }
}
