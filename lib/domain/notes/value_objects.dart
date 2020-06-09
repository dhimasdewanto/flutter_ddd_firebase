import 'package:dartz/dartz.dart';
import 'package:firebase_ddd_course/domain/core/failures.dart';
import 'package:firebase_ddd_course/domain/core/value_objects.dart';
import 'package:firebase_ddd_course/domain/core/value_transformers.dart';
import 'package:firebase_ddd_course/domain/core/value_validators.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';

class NoteBody extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  factory NoteBody(String input) {
    return NoteBody._(
      validateMaxStringLength(
        input: input,
        maxLength: maxLength,

        // It's like if -> else if -> else if -> etc statements
      ).flatMap(
        (valueFromPreviousFunction) => validateStringNotEmpty(
          input: valueFromPreviousFunction,
        ),
      ),
    );
  }

  const NoteBody._(this.value);
}

class ToDoName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  factory ToDoName(String input) {
    return ToDoName._(
      validateMaxStringLength(
        input: input,
        maxLength: maxLength,

        // It's like if -> else if -> else if -> etc statements
      ).flatMap(
        (valueFromPreviousFunction) => validateStringNotEmpty(
          input: valueFromPreviousFunction,
        ).flatMap(
          (valueFromPreviousFunction) => validateSingleLine(
            input: valueFromPreviousFunction,
          ),
        ),
      ),
    );
  }

  const ToDoName._(this.value);
}

class NoteColor extends ValueObject<Color> {
  @override
  final Either<ValueFailure<Color>, Color> value;

  static const List<Color> predefinedColor = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.cyan,
    Colors.pink,
  ];

  factory NoteColor(Color input) {
    return NoteColor._(
      right(makeColorOpaque(input)),
    );
  }

  const NoteColor._(this.value);
}

class List3<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 3;

  factory List3(KtList<T> input) {
    return List3._(
      validateMaxListLength(
        input: input,
        maxLength: maxLength,
      ),
    );
  }

  const List3._(this.value);

  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  bool get isFull {
    return length == maxLength;
  }
}
