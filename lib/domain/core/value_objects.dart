import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'errors.dart';
import 'failures.dart';

abstract class ValueObject<T> extends Equatable {
  const ValueObject();

  @override
  List<Object> get props => [value];

  @override
  bool get stringify => true;

  Either<ValueFailure<T>, T> get value;

  bool get isValid => value.isRight();

  /// Get value or throw [UnexpectedValueError] containing [ValueFailure]
  T get valueOrCrash {
    return value.fold(
      (fail) => throw UnexpectedValueError(fail),
      // id = identity - same as writing (right) => right
      id,
    );
  }
}
