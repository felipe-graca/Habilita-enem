import 'package:formz/formz.dart';

enum NumberValidatorError { invalid }

class NumberValidator extends FormzInput<String, NumberValidatorError> {
  final bool optional;

  const NumberValidator.pure({String value = '', this.optional = false})
      : super.pure(value);

  const NumberValidator.dirty({String value = '', this.optional = false})
      : super.dirty(value);

  @override
  NumberValidatorError? validator(String? value) {
    if (optional) {
      return null;
    }

    return (value ?? '').isNotEmpty ? null : NumberValidatorError.invalid;
  }
}
