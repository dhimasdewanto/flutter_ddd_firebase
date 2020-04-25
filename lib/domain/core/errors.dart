import 'package:firebase_ddd_course/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  UnexpectedValueError(this.valueFailure);

  final ValueFailure valueFailure;

  @override
  String toString() {
    const explanation  = "Encounter a ValueFailure at an unrecoverable point. Terminating.";
    return Error.safeToString("$explanation Failure was: $valueFailure");
  }
}