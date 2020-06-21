// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'note_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
NoteDto _$NoteDtoFromJson(Map<String, dynamic> json) {
  return _NoteDto.fromJson(json);
}

class _$NoteDtoTearOff {
  const _$NoteDtoTearOff();

  _NoteDto call(
      {@JsonKey(ignore: true) String id,
      @required String body,
      @required int color,
      @required List<ToDoItemDto> todos,
      @required @ServerStampConverter() FieldValue serverTimeStamp}) {
    return _NoteDto(
      id: id,
      body: body,
      color: color,
      todos: todos,
      serverTimeStamp: serverTimeStamp,
    );
  }
}

// ignore: unused_element
const $NoteDto = _$NoteDtoTearOff();

mixin _$NoteDto {
  @JsonKey(ignore: true)
  String get id;
  String get body;
  int get color;
  List<ToDoItemDto> get todos;
  @ServerStampConverter()
  FieldValue get serverTimeStamp;

  Map<String, dynamic> toJson();
  $NoteDtoCopyWith<NoteDto> get copyWith;
}

abstract class $NoteDtoCopyWith<$Res> {
  factory $NoteDtoCopyWith(NoteDto value, $Res Function(NoteDto) then) =
      _$NoteDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      String body,
      int color,
      List<ToDoItemDto> todos,
      @ServerStampConverter() FieldValue serverTimeStamp});
}

class _$NoteDtoCopyWithImpl<$Res> implements $NoteDtoCopyWith<$Res> {
  _$NoteDtoCopyWithImpl(this._value, this._then);

  final NoteDto _value;
  // ignore: unused_field
  final $Res Function(NoteDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object body = freezed,
    Object color = freezed,
    Object todos = freezed,
    Object serverTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      body: body == freezed ? _value.body : body as String,
      color: color == freezed ? _value.color : color as int,
      todos: todos == freezed ? _value.todos : todos as List<ToDoItemDto>,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
    ));
  }
}

abstract class _$NoteDtoCopyWith<$Res> implements $NoteDtoCopyWith<$Res> {
  factory _$NoteDtoCopyWith(_NoteDto value, $Res Function(_NoteDto) then) =
      __$NoteDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String id,
      String body,
      int color,
      List<ToDoItemDto> todos,
      @ServerStampConverter() FieldValue serverTimeStamp});
}

class __$NoteDtoCopyWithImpl<$Res> extends _$NoteDtoCopyWithImpl<$Res>
    implements _$NoteDtoCopyWith<$Res> {
  __$NoteDtoCopyWithImpl(_NoteDto _value, $Res Function(_NoteDto) _then)
      : super(_value, (v) => _then(v as _NoteDto));

  @override
  _NoteDto get _value => super._value as _NoteDto;

  @override
  $Res call({
    Object id = freezed,
    Object body = freezed,
    Object color = freezed,
    Object todos = freezed,
    Object serverTimeStamp = freezed,
  }) {
    return _then(_NoteDto(
      id: id == freezed ? _value.id : id as String,
      body: body == freezed ? _value.body : body as String,
      color: color == freezed ? _value.color : color as int,
      todos: todos == freezed ? _value.todos : todos as List<ToDoItemDto>,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
    ));
  }
}

@JsonSerializable()
class _$_NoteDto extends _NoteDto with DiagnosticableTreeMixin {
  const _$_NoteDto(
      {@JsonKey(ignore: true) this.id,
      @required this.body,
      @required this.color,
      @required this.todos,
      @required @ServerStampConverter() this.serverTimeStamp})
      : assert(body != null),
        assert(color != null),
        assert(todos != null),
        assert(serverTimeStamp != null),
        super._();

  factory _$_NoteDto.fromJson(Map<String, dynamic> json) =>
      _$_$_NoteDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String body;
  @override
  final int color;
  @override
  final List<ToDoItemDto> todos;
  @override
  @ServerStampConverter()
  final FieldValue serverTimeStamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NoteDto(id: $id, body: $body, color: $color, todos: $todos, serverTimeStamp: $serverTimeStamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NoteDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('todos', todos))
      ..add(DiagnosticsProperty('serverTimeStamp', serverTimeStamp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoteDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.todos, todos) ||
                const DeepCollectionEquality().equals(other.todos, todos)) &&
            (identical(other.serverTimeStamp, serverTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.serverTimeStamp, serverTimeStamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(todos) ^
      const DeepCollectionEquality().hash(serverTimeStamp);

  @override
  _$NoteDtoCopyWith<_NoteDto> get copyWith =>
      __$NoteDtoCopyWithImpl<_NoteDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NoteDtoToJson(this);
  }
}

abstract class _NoteDto extends NoteDto {
  const _NoteDto._() : super._();
  const factory _NoteDto(
          {@JsonKey(ignore: true) String id,
          @required String body,
          @required int color,
          @required List<ToDoItemDto> todos,
          @required @ServerStampConverter() FieldValue serverTimeStamp}) =
      _$_NoteDto;

  factory _NoteDto.fromJson(Map<String, dynamic> json) = _$_NoteDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get body;
  @override
  int get color;
  @override
  List<ToDoItemDto> get todos;
  @override
  @ServerStampConverter()
  FieldValue get serverTimeStamp;
  @override
  _$NoteDtoCopyWith<_NoteDto> get copyWith;
}

ToDoItemDto _$ToDoItemDtoFromJson(Map<String, dynamic> json) {
  return _ToDoItemDto.fromJson(json);
}

class _$ToDoItemDtoTearOff {
  const _$ToDoItemDtoTearOff();

  _ToDoItemDto call(
      {@required String id, @required String name, @required bool done}) {
    return _ToDoItemDto(
      id: id,
      name: name,
      done: done,
    );
  }
}

// ignore: unused_element
const $ToDoItemDto = _$ToDoItemDtoTearOff();

mixin _$ToDoItemDto {
  String get id;
  String get name;
  bool get done;

  Map<String, dynamic> toJson();
  $ToDoItemDtoCopyWith<ToDoItemDto> get copyWith;
}

abstract class $ToDoItemDtoCopyWith<$Res> {
  factory $ToDoItemDtoCopyWith(
          ToDoItemDto value, $Res Function(ToDoItemDto) then) =
      _$ToDoItemDtoCopyWithImpl<$Res>;
  $Res call({String id, String name, bool done});
}

class _$ToDoItemDtoCopyWithImpl<$Res> implements $ToDoItemDtoCopyWith<$Res> {
  _$ToDoItemDtoCopyWithImpl(this._value, this._then);

  final ToDoItemDto _value;
  // ignore: unused_field
  final $Res Function(ToDoItemDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object done = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

abstract class _$ToDoItemDtoCopyWith<$Res>
    implements $ToDoItemDtoCopyWith<$Res> {
  factory _$ToDoItemDtoCopyWith(
          _ToDoItemDto value, $Res Function(_ToDoItemDto) then) =
      __$ToDoItemDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, bool done});
}

class __$ToDoItemDtoCopyWithImpl<$Res> extends _$ToDoItemDtoCopyWithImpl<$Res>
    implements _$ToDoItemDtoCopyWith<$Res> {
  __$ToDoItemDtoCopyWithImpl(
      _ToDoItemDto _value, $Res Function(_ToDoItemDto) _then)
      : super(_value, (v) => _then(v as _ToDoItemDto));

  @override
  _ToDoItemDto get _value => super._value as _ToDoItemDto;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object done = freezed,
  }) {
    return _then(_ToDoItemDto(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

@JsonSerializable()
class _$_ToDoItemDto extends _ToDoItemDto with DiagnosticableTreeMixin {
  const _$_ToDoItemDto(
      {@required this.id, @required this.name, @required this.done})
      : assert(id != null),
        assert(name != null),
        assert(done != null),
        super._();

  factory _$_ToDoItemDto.fromJson(Map<String, dynamic> json) =>
      _$_$_ToDoItemDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool done;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDoItemDto(id: $id, name: $name, done: $done)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDoItemDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('done', done));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ToDoItemDto &&
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
  _$ToDoItemDtoCopyWith<_ToDoItemDto> get copyWith =>
      __$ToDoItemDtoCopyWithImpl<_ToDoItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ToDoItemDtoToJson(this);
  }
}

abstract class _ToDoItemDto extends ToDoItemDto {
  const _ToDoItemDto._() : super._();
  const factory _ToDoItemDto(
      {@required String id,
      @required String name,
      @required bool done}) = _$_ToDoItemDto;

  factory _ToDoItemDto.fromJson(Map<String, dynamic> json) =
      _$_ToDoItemDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get done;
  @override
  _$ToDoItemDtoCopyWith<_ToDoItemDto> get copyWith;
}
