import 'package:flutter_ddd_firebase/domain/core/value_objects.dart';
import 'package:flutter_ddd_firebase/domain/notes/todo_item.dart';
import 'package:flutter_ddd_firebase/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_item_presentation_classes.freezed.dart';

@freezed
abstract class ToDoItemPrimitive implements _$ToDoItemPrimitive {
  const factory ToDoItemPrimitive({
    @required UniqueId id,
    @required String name,
    @required bool done,
  }) = _ToDoItemPrimitive;

  const ToDoItemPrimitive._();

  factory ToDoItemPrimitive.empty() => ToDoItemPrimitive(
    id: UniqueId(),
    name: "",
    done: false,
  );

  factory ToDoItemPrimitive.fromDomain(ToDoItem todoItem) {
    return ToDoItemPrimitive(
      id: todoItem.id,
      name: todoItem.name.valueOrCrash,
      done: todoItem.done,
    );
  }

  ToDoItem toDomain() {
    return ToDoItem(
      id: id,
      name: ToDoName(name),
      done: done,
    );
  }
}