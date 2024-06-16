// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editor_widget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditorWidgetState {
  Note? get note => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditorWidgetStateCopyWith<EditorWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditorWidgetStateCopyWith<$Res> {
  factory $EditorWidgetStateCopyWith(
          EditorWidgetState value, $Res Function(EditorWidgetState) then) =
      _$EditorWidgetStateCopyWithImpl<$Res, EditorWidgetState>;
  @useResult
  $Res call({Note? note});
}

/// @nodoc
class _$EditorWidgetStateCopyWithImpl<$Res, $Val extends EditorWidgetState>
    implements $EditorWidgetStateCopyWith<$Res> {
  _$EditorWidgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditorWidgetStateImplCopyWith<$Res>
    implements $EditorWidgetStateCopyWith<$Res> {
  factory _$$EditorWidgetStateImplCopyWith(_$EditorWidgetStateImpl value,
          $Res Function(_$EditorWidgetStateImpl) then) =
      __$$EditorWidgetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Note? note});
}

/// @nodoc
class __$$EditorWidgetStateImplCopyWithImpl<$Res>
    extends _$EditorWidgetStateCopyWithImpl<$Res, _$EditorWidgetStateImpl>
    implements _$$EditorWidgetStateImplCopyWith<$Res> {
  __$$EditorWidgetStateImplCopyWithImpl(_$EditorWidgetStateImpl _value,
      $Res Function(_$EditorWidgetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = freezed,
  }) {
    return _then(_$EditorWidgetStateImpl(
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note?,
    ));
  }
}

/// @nodoc

class _$EditorWidgetStateImpl implements _EditorWidgetState {
  _$EditorWidgetStateImpl({this.note});

  @override
  final Note? note;

  @override
  String toString() {
    return 'EditorWidgetState(note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorWidgetStateImpl &&
            const DeepCollectionEquality().equals(other.note, note));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(note));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorWidgetStateImplCopyWith<_$EditorWidgetStateImpl> get copyWith =>
      __$$EditorWidgetStateImplCopyWithImpl<_$EditorWidgetStateImpl>(
          this, _$identity);
}

abstract class _EditorWidgetState implements EditorWidgetState {
  factory _EditorWidgetState({final Note? note}) = _$EditorWidgetStateImpl;

  @override
  Note? get note;
  @override
  @JsonKey(ignore: true)
  _$$EditorWidgetStateImplCopyWith<_$EditorWidgetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
