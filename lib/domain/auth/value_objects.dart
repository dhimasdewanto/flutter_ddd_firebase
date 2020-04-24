import 'package:dartz/dartz.dart';
import 'package:firebase_ddd_course/domain/core/failures.dart';
import 'package:firebase_ddd_course/domain/core/value_objects.dart';
import 'package:firebase_ddd_course/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  const EmailAddress._(this.value);

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  final Either<ValueFailure<String>, String> value;
}

class PasswordValue extends ValueObject<String> {
  const PasswordValue._(this.value);

  factory PasswordValue(String input) {
    return PasswordValue._(
      validatePassword(input),
    );
  }

  final Either<ValueFailure<String>, String> value;
}