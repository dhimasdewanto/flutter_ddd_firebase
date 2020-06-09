import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:kt_dart/kt.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateMaxStringLength({
  @required String input,
  @required int maxLength,
}) {
  if (input.length <= maxLength) {
    return right(input);
  }

  return left(ValueFailure.exceedingLength(
    failedValue: input,
    max: maxLength,
  ));
}

Either<ValueFailure<String>, String> validateStringNotEmpty({
  @required String input,
}) {
  if (input.isNotEmpty) {
    return right(input);
  }

  return left(ValueFailure.empty(
    failedValue: input,
  ));
}

Either<ValueFailure<String>, String> validateSingleLine({
  @required String input,
}) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(
      failedValue: input,
    ));
  }
  return right(input);
}

Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLength<T>({
  @required KtList<T> input,
  @required int maxLength,
}) {
  if (input.size <= maxLength) {
    return right(input);
  }

  return left(ValueFailure.listTooLong(
    failedValue: input,
    max: maxLength,
  ));
}

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
