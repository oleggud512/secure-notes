// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_auth_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalAuthPageState {
  String get password => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalAuthPageStateCopyWith<LocalAuthPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalAuthPageStateCopyWith<$Res> {
  factory $LocalAuthPageStateCopyWith(
          LocalAuthPageState value, $Res Function(LocalAuthPageState) then) =
      _$LocalAuthPageStateCopyWithImpl<$Res, LocalAuthPageState>;
  @useResult
  $Res call({String password, String? error});
}

/// @nodoc
class _$LocalAuthPageStateCopyWithImpl<$Res, $Val extends LocalAuthPageState>
    implements $LocalAuthPageStateCopyWith<$Res> {
  _$LocalAuthPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalAuthPageStateCopyWith<$Res>
    implements $LocalAuthPageStateCopyWith<$Res> {
  factory _$$_LocalAuthPageStateCopyWith(_$_LocalAuthPageState value,
          $Res Function(_$_LocalAuthPageState) then) =
      __$$_LocalAuthPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String password, String? error});
}

/// @nodoc
class __$$_LocalAuthPageStateCopyWithImpl<$Res>
    extends _$LocalAuthPageStateCopyWithImpl<$Res, _$_LocalAuthPageState>
    implements _$$_LocalAuthPageStateCopyWith<$Res> {
  __$$_LocalAuthPageStateCopyWithImpl(
      _$_LocalAuthPageState _value, $Res Function(_$_LocalAuthPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? error = freezed,
  }) {
    return _then(_$_LocalAuthPageState(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LocalAuthPageState implements _LocalAuthPageState {
  _$_LocalAuthPageState({this.password = "", this.error});

  @override
  @JsonKey()
  final String password;
  @override
  final String? error;

  @override
  String toString() {
    return 'LocalAuthPageState(password: $password, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalAuthPageState &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalAuthPageStateCopyWith<_$_LocalAuthPageState> get copyWith =>
      __$$_LocalAuthPageStateCopyWithImpl<_$_LocalAuthPageState>(
          this, _$identity);
}

abstract class _LocalAuthPageState implements LocalAuthPageState {
  factory _LocalAuthPageState({final String password, final String? error}) =
      _$_LocalAuthPageState;

  @override
  String get password;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_LocalAuthPageStateCopyWith<_$_LocalAuthPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
