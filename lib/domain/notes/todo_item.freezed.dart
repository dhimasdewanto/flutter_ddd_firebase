// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'todo_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ToDoItemTearOff {
  const _$ToDoItemTearOff();

  _ToDoItem call(
      {@required UniqueId id, @required ToDoName name, @required bool done}) {
    return _ToDoItem(
      id: id,
      name: name,
      done: done,
    );
  }
}

// ignore: unused_element
const $ToDoItem = _$ToDoItemTearOff();

mixin _$ToDoItem {
  UniqueId get id;
  ToDoName get name;
  bool get done;

  $ToDoItemCopyWith<ToDoItem> get copyWith;
}

abstract class $ToDoItemCopyWith<$Res> {
  factory $ToDoItemCopyWith(ToDoItem value, $Res Function(ToDoItem) then) =
      _$ToDoItemCopyWithImpl<$Res>;
  $Res call({UniqueId id, ToDoName name, bool done});
}

class _$ToDoItemCopyWithImpl<$Res> implements $ToDoItemCopyWith<$Res> {
  _$ToDoItemCopyWithImpl(this._value, this._then);

  final ToDoItem _value;
  // ignore: unused_field
  final $Res Function(ToDoItem) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object done = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as ToDoName,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

abstract class _$ToDoItemCopyWith<$Res> implements $ToDoItemCopyWith<$Res> {
  factory _$ToDoItemCopyWith(_ToDoItem value, $Res Function(_ToDoItem) then) =
      __$ToDoItemCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, ToDoName name, bool done});
}

class __$ToDoItemCopyWithImpl<$Res> extends _$ToDoItemCopyWithImpl<$Res>
    implements _$ToDoItemCopyWith<$Res> {
  __$ToDoItemCopyWithImpl(_ToDoItem _value, $Res Function(_ToDoItem) _then)
      : super(_value, (v) => _then(v as _ToDoItem));

  @override
  _ToDoItem get _value => super._value as _ToDoItem;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object done = freezed,
  }) {
    return _then(_ToDoItem(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as ToDoName,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

class _$_ToDoItem extends _ToDoItem {
  const _$_ToDoItem(
      {@required this.id, @required this.name, @required this.done})
      : assert(id != null),
        assert(name != null),
        assert(done != null),
        super._();

  @override
  final UniqueId id;
  @override
  final ToDoName name;
  @override
  final bool done;

  @override
  String toString() {
    return 'ToDoItem(id: $id, name: $name, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ToDoItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(done);

  @override
  _$ToDoItemCopyWith<_ToDoItem> get copyWith =>
      __$ToDoItemCopyWithImpl<_ToDoItem>(this, _$identity);
}

abstract class _ToDoItem extends ToDoItem {
  const _ToDoItem._() : super._();
  const factory _ToDoItem(
      {@required UniqueId id,
      @required ToDoName name,
      @required bool done}) = _$_ToDoItem;

  @override
  UniqueId get id;
  @override
  ToDoName get name;
  @override
  bool get done;
  @override
  _$ToDoItemCopyWith<_ToDoItem> get copyWith;
}
