// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) {
  return _TaskDto.fromJson(json);
}

/// @nodoc
mixin _$TaskDto {
  String get status => throw _privateConstructorUsedError;
  TodoTaskModel get element => throw _privateConstructorUsedError;
  int get revision => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskDtoCopyWith<TaskDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDtoCopyWith<$Res> {
  factory $TaskDtoCopyWith(TaskDto value, $Res Function(TaskDto) then) =
      _$TaskDtoCopyWithImpl<$Res, TaskDto>;
  @useResult
  $Res call({String status, TodoTaskModel element, int revision});
}

/// @nodoc
class _$TaskDtoCopyWithImpl<$Res, $Val extends TaskDto>
    implements $TaskDtoCopyWith<$Res> {
  _$TaskDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? element = null,
    Object? revision = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      element: null == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as TodoTaskModel,
      revision: null == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskDtoImplCopyWith<$Res> implements $TaskDtoCopyWith<$Res> {
  factory _$$TaskDtoImplCopyWith(
          _$TaskDtoImpl value, $Res Function(_$TaskDtoImpl) then) =
      __$$TaskDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, TodoTaskModel element, int revision});
}

/// @nodoc
class __$$TaskDtoImplCopyWithImpl<$Res>
    extends _$TaskDtoCopyWithImpl<$Res, _$TaskDtoImpl>
    implements _$$TaskDtoImplCopyWith<$Res> {
  __$$TaskDtoImplCopyWithImpl(
      _$TaskDtoImpl _value, $Res Function(_$TaskDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? element = null,
    Object? revision = null,
  }) {
    return _then(_$TaskDtoImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      element: null == element
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as TodoTaskModel,
      revision: null == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$TaskDtoImpl implements _TaskDto {
  const _$TaskDtoImpl(
      {required this.status, required this.element, required this.revision});

  factory _$TaskDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskDtoImplFromJson(json);

  @override
  final String status;
  @override
  final TodoTaskModel element;
  @override
  final int revision;

  @override
  String toString() {
    return 'TaskDto(status: $status, element: $element, revision: $revision)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDtoImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.element, element) || other.element == element) &&
            (identical(other.revision, revision) ||
                other.revision == revision));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, element, revision);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDtoImplCopyWith<_$TaskDtoImpl> get copyWith =>
      __$$TaskDtoImplCopyWithImpl<_$TaskDtoImpl>(this, _$identity);
}

abstract class _TaskDto implements TaskDto {
  const factory _TaskDto(
      {required final String status,
      required final TodoTaskModel element,
      required final int revision}) = _$TaskDtoImpl;

  factory _TaskDto.fromJson(Map<String, dynamic> json) = _$TaskDtoImpl.fromJson;

  @override
  String get status;
  @override
  TodoTaskModel get element;
  @override
  int get revision;
  @override
  @JsonKey(ignore: true)
  _$$TaskDtoImplCopyWith<_$TaskDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TasksDto _$TasksDtoFromJson(Map<String, dynamic> json) {
  return _TasksDto.fromJson(json);
}

/// @nodoc
mixin _$TasksDto {
  String get status => throw _privateConstructorUsedError;
  List<TodoTaskModel> get list => throw _privateConstructorUsedError;
  int get revision => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TasksDtoCopyWith<TasksDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksDtoCopyWith<$Res> {
  factory $TasksDtoCopyWith(TasksDto value, $Res Function(TasksDto) then) =
      _$TasksDtoCopyWithImpl<$Res, TasksDto>;
  @useResult
  $Res call({String status, List<TodoTaskModel> list, int revision});
}

/// @nodoc
class _$TasksDtoCopyWithImpl<$Res, $Val extends TasksDto>
    implements $TasksDtoCopyWith<$Res> {
  _$TasksDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? list = null,
    Object? revision = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TodoTaskModel>,
      revision: null == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TasksDtoImplCopyWith<$Res>
    implements $TasksDtoCopyWith<$Res> {
  factory _$$TasksDtoImplCopyWith(
          _$TasksDtoImpl value, $Res Function(_$TasksDtoImpl) then) =
      __$$TasksDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, List<TodoTaskModel> list, int revision});
}

/// @nodoc
class __$$TasksDtoImplCopyWithImpl<$Res>
    extends _$TasksDtoCopyWithImpl<$Res, _$TasksDtoImpl>
    implements _$$TasksDtoImplCopyWith<$Res> {
  __$$TasksDtoImplCopyWithImpl(
      _$TasksDtoImpl _value, $Res Function(_$TasksDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? list = null,
    Object? revision = null,
  }) {
    return _then(_$TasksDtoImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TodoTaskModel>,
      revision: null == revision
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$TasksDtoImpl implements _TasksDto {
  const _$TasksDtoImpl(
      {required this.status,
      required final List<TodoTaskModel> list,
      required this.revision})
      : _list = list;

  factory _$TasksDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TasksDtoImplFromJson(json);

  @override
  final String status;
  final List<TodoTaskModel> _list;
  @override
  List<TodoTaskModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final int revision;

  @override
  String toString() {
    return 'TasksDto(status: $status, list: $list, revision: $revision)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksDtoImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.revision, revision) ||
                other.revision == revision));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_list), revision);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksDtoImplCopyWith<_$TasksDtoImpl> get copyWith =>
      __$$TasksDtoImplCopyWithImpl<_$TasksDtoImpl>(this, _$identity);
}

abstract class _TasksDto implements TasksDto {
  const factory _TasksDto(
      {required final String status,
      required final List<TodoTaskModel> list,
      required final int revision}) = _$TasksDtoImpl;

  factory _TasksDto.fromJson(Map<String, dynamic> json) =
      _$TasksDtoImpl.fromJson;

  @override
  String get status;
  @override
  List<TodoTaskModel> get list;
  @override
  int get revision;
  @override
  @JsonKey(ignore: true)
  _$$TasksDtoImplCopyWith<_$TasksDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
