// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_dialog_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChangePasswordDialogState {
  String get oldPassword => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangePasswordDialogStateCopyWith<ChangePasswordDialogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordDialogStateCopyWith<$Res> {
  factory $ChangePasswordDialogStateCopyWith(ChangePasswordDialogState value,
          $Res Function(ChangePasswordDialogState) then) =
      _$ChangePasswordDialogStateCopyWithImpl<$Res, ChangePasswordDialogState>;
  @useResult
  $Res call({String oldPassword, String newPassword});
}

/// @nodoc
class _$ChangePasswordDialogStateCopyWithImpl<$Res,
        $Val extends ChangePasswordDialogState>
    implements $ChangePasswordDialogStateCopyWith<$Res> {
  _$ChangePasswordDialogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_value.copyWith(
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChangePasswordStateCopyWith<$Res>
    implements $ChangePasswordDialogStateCopyWith<$Res> {
  factory _$$_ChangePasswordStateCopyWith(_$_ChangePasswordState value,
          $Res Function(_$_ChangePasswordState) then) =
      __$$_ChangePasswordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String oldPassword, String newPassword});
}

/// @nodoc
class __$$_ChangePasswordStateCopyWithImpl<$Res>
    extends _$ChangePasswordDialogStateCopyWithImpl<$Res,
        _$_ChangePasswordState>
    implements _$$_ChangePasswordStateCopyWith<$Res> {
  __$$_ChangePasswordStateCopyWithImpl(_$_ChangePasswordState _value,
      $Res Function(_$_ChangePasswordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_$_ChangePasswordState(
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangePasswordState implements _ChangePasswordState {
  _$_ChangePasswordState({this.oldPassword = "", this.newPassword = ""});

  @override
  @JsonKey()
  final String oldPassword;
  @override
  @JsonKey()
  final String newPassword;

  @override
  String toString() {
    return 'ChangePasswordDialogState(oldPassword: $oldPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePasswordState &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldPassword, newPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangePasswordStateCopyWith<_$_ChangePasswordState> get copyWith =>
      __$$_ChangePasswordStateCopyWithImpl<_$_ChangePasswordState>(
          this, _$identity);
}

abstract class _ChangePasswordState implements ChangePasswordDialogState {
  factory _ChangePasswordState(
      {final String oldPassword,
      final String newPassword}) = _$_ChangePasswordState;

  @override
  String get oldPassword;
  @override
  String get newPassword;
  @override
  @JsonKey(ignore: true)
  _$$_ChangePasswordStateCopyWith<_$_ChangePasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
