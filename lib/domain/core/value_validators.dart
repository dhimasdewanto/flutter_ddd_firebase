import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String value) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(emailRegex).hasMatch(value)) {
    return right(value);
  }

  return left(ValueFailure.invalidEmail(failedValue: value));
}

Either<ValueFailure<String>, String> validatePassword(String value) {
  if (value.length >= 6) {
    return right(value);
  }

  return left(ValueFailure.invalidEmail(failedValue: value));
}