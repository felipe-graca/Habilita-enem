import 'package:formz/formz.dart';

enum RadioValidatorError { invalid }

class RadioValidator extends FormzInput<String, RadioValidatorError> {
  final bool optional;

  const RadioValidator.pure({String value = '', this.optional = false})
      : super.pure(value);

  const RadioValidator.dirty({String value = '', this.optional = false})
      : super.dirty(value);

  @override
  RadioValidatorError? validator(String? value) {
    if (optional) {
      return null;
    }

    return (value ?? '').isNotEmpty ? null : RadioValidatorError.invalid;
  }
}
