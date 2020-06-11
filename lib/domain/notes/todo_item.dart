import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_firebase/domain/core/failures.dart';
import 'package:flutter_ddd_firebase/domain/core/value_objects.dart';
import 'package:flutter_ddd_firebase/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';

@freezed
abstract class ToDoItem implements _$ToDoItem {
  const factory ToDoItem({
    @required UniqueId id,
    @required ToDoName name,
    @required bool done,
  }) = _ToDoItem;

  const ToDoItem._();

  factory ToDoItem.empty() => ToDoItem(
        id: UniqueId(),
        name: ToDoName(''),
        done: false,
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.value.fold(
      (failure) => some(failure),
      (_) => none(),
    );
  }
}
