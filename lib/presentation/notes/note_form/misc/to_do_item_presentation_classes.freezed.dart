// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'to_do_item_presentation_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ToDoItemPrimitiveTearOff {
  const _$ToDoItemPrimitiveTearOff();

// ignore: unused_element
  _ToDoItemPrimitive call(
      {@required UniqueId id, @required String name, @required bool done}) {
    return _ToDoItemPrimitive(
      id: id,
      name: name,
      done: done,
    );
  }
}

// ignore: unused_element
const $ToDoItemPrimitive = _$ToDoItemPrimitiveTearOff();

mixin _$ToDoItemPrimitive {
  UniqueId get id;
  String get name;
  bool get done;

  $ToDoItemPrimitiveCopyWith<ToDoItemPrimitive> get copyWith;
}

abstract class $ToDoItemPrimitiveCopyWith<$Res> {
  factory $ToDoItemPrimitiveCopyWith(
          ToDoItemPrimitive value, $Res Function(ToDoItemPrimitive) then) =
      _$ToDoItemPrimitiveCopyWithImpl<$Res>;
  $Res call({UniqueId id, String name, bool done});
}

class _$ToDoItemPrimitiveCopyWithImpl<$Res>
    implements $ToDoItemPrimitiveCopyWith<$Res> {
  _$ToDoItemPrimitiveCopyWithImpl(this._value, this._then);

  final ToDoItemPrimitive _value;
  // ignore: unused_field
  final $Res Function(ToDoItemPrimitive) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object done = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as String,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

abstract class _$ToDoItemPrimitiveCopyWith<$Res>
    implements $ToDoItemPrimitiveCopyWith<$Res> {
  factory _$ToDoItemPrimitiveCopyWith(
          _ToDoItemPrimitive value, $Res Function(_ToDoItemPrimitive) then) =
      __$ToDoItemPrimitiveCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, String name, bool done});
}

class __$ToDoItemPrimitiveCopyWithImpl<$Res>
    extends _$ToDoItemPrimitiveCopyWithImpl<$Res>
    implements _$ToDoItemPrimitiveCopyWith<$Res> {
  __$ToDoItemPrimitiveCopyWithImpl(
      _ToDoItemPrimitive _value, $Res Function(_ToDoItemPrimitive) _then)
      : super(_value, (v) => _then(v as _ToDoItemPrimitive));

  @override
  _ToDoItemPrimitive get _value => super._value as _ToDoItemPrimitive;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object done = freezed,
  }) {
    return _then(_ToDoItemPrimitive(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as String,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

class _$_ToDoItemPrimitive extends _ToDoItemPrimitive {
  const _$_ToDoItemPrimitive(
      {@required this.id, @required this.name, @required this.done})
      : assert(id != null),
        assert(name != null),
        assert(done != null),
        super._();

  @override
  final UniqueId id;
  @override
  final String name;
  @override
  final bool done;

  @override
  String toString() {
    return 'ToDoItemPrimitive(id: $id, name: $name, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ToDoItemPrimitive &&
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
  _$ToDoItemPrimitiveCopyWith<_ToDoItemPrimitive> get copyWith =>
      __$ToDoItemPrimitiveCopyWithImpl<_ToDoItemPrimitive>(this, _$identity);
}

abstract class _ToDoItemPrimitive extends ToDoItemPrimitive {
  const _ToDoItemPrimitive._() : super._();
  const factory _ToDoItemPrimitive(
      {@required UniqueId id,
      @required String name,
      @required bool done}) = _$_ToDoItemPrimitive;

  @override
  UniqueId get id;
  @override
  String get name;
  @override
  bool get done;
  @override
  _$ToDoItemPrimitiveCopyWith<_ToDoItemPrimitive> get copyWith;
}
