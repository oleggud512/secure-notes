// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Node _$NodeFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'default':
      return _Node.fromJson(json);
    case 'folder':
      return Folder.fromJson(json);
    case 'note':
      return Note.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'Node', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$Node {
  String get id => throw _privateConstructorUsedError;
  String? get parent => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  NodeState get state => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get isDecryptionError => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)
        $default, {
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            List<Node> children,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)
        folder,
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)
        note,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        $default, {
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            List<Node> children,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        folder,
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        note,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        $default, {
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            List<Node> children,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        folder,
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        note,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Node value) $default, {
    required TResult Function(Folder value) folder,
    required TResult Function(Note value) note,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Node value)? $default, {
    TResult? Function(Folder value)? folder,
    TResult? Function(Note value)? note,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Node value)? $default, {
    TResult Function(Folder value)? folder,
    TResult Function(Note value)? note,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NodeCopyWith<Node> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeCopyWith<$Res> {
  factory $NodeCopyWith(Node value, $Res Function(Node) then) =
      _$NodeCopyWithImpl<$Res, Node>;
  @useResult
  $Res call(
      {String id,
      String? parent,
      String title,
      DateTime createdAt,
      DateTime updatedAt,
      NodeState state,
      @JsonKey(includeToJson: false, includeFromJson: false)
      bool isDecryptionError});
}

/// @nodoc
class _$NodeCopyWithImpl<$Res, $Val extends Node>
    implements $NodeCopyWith<$Res> {
  _$NodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parent = freezed,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? state = null,
    Object? isDecryptionError = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as NodeState,
      isDecryptionError: null == isDecryptionError
          ? _value.isDecryptionError
          : isDecryptionError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NodeImplCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$$NodeImplCopyWith(
          _$NodeImpl value, $Res Function(_$NodeImpl) then) =
      __$$NodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? parent,
      String title,
      DateTime createdAt,
      DateTime updatedAt,
      NodeState state,
      @JsonKey(includeToJson: false, includeFromJson: false)
      bool isDecryptionError});
}

/// @nodoc
class __$$NodeImplCopyWithImpl<$Res>
    extends _$NodeCopyWithImpl<$Res, _$NodeImpl>
    implements _$$NodeImplCopyWith<$Res> {
  __$$NodeImplCopyWithImpl(_$NodeImpl _value, $Res Function(_$NodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parent = freezed,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? state = null,
    Object? isDecryptionError = null,
  }) {
    return _then(_$NodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as NodeState,
      isDecryptionError: null == isDecryptionError
          ? _value.isDecryptionError
          : isDecryptionError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NodeImpl implements _Node {
  _$NodeImpl(
      {required this.id,
      this.parent,
      required this.title,
      required this.createdAt,
      required this.updatedAt,
      required this.state,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.isDecryptionError = false,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$NodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NodeImplFromJson(json);

  @override
  final String id;
  @override
  final String? parent;
  @override
  final String title;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final NodeState state;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final bool isDecryptionError;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Node(id: $id, parent: $parent, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, state: $state, isDecryptionError: $isDecryptionError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.isDecryptionError, isDecryptionError) ||
                other.isDecryptionError == isDecryptionError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, parent, title, createdAt,
      updatedAt, state, isDecryptionError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NodeImplCopyWith<_$NodeImpl> get copyWith =>
      __$$NodeImplCopyWithImpl<_$NodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)
        $default, {
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            List<Node> children,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)
        folder,
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)
        note,
  }) {
    return $default(
        id, parent, title, createdAt, updatedAt, state, isDecryptionError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        $default, {
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            List<Node> children,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        folder,
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        note,
  }) {
    return $default?.call(
        id, parent, title, createdAt, updatedAt, state, isDecryptionError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        $default, {
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            List<Node> children,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        folder,
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        note,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          id, parent, title, createdAt, updatedAt, state, isDecryptionError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Node value) $default, {
    required TResult Function(Folder value) folder,
    required TResult Function(Note value) note,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Node value)? $default, {
    TResult? Function(Folder value)? folder,
    TResult? Function(Note value)? note,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Node value)? $default, {
    TResult Function(Folder value)? folder,
    TResult Function(Note value)? note,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NodeImplToJson(
      this,
    );
  }
}

abstract class _Node implements Node {
  factory _Node(
      {required final String id,
      final String? parent,
      required final String title,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final NodeState state,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final bool isDecryptionError}) = _$NodeImpl;

  factory _Node.fromJson(Map<String, dynamic> json) = _$NodeImpl.fromJson;

  @override
  String get id;
  @override
  String? get parent;
  @override
  String get title;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  NodeState get state;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get isDecryptionError;
  @override
  @JsonKey(ignore: true)
  _$$NodeImplCopyWith<_$NodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FolderImplCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$$FolderImplCopyWith(
          _$FolderImpl value, $Res Function(_$FolderImpl) then) =
      __$$FolderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? parent,
      String title,
      DateTime createdAt,
      DateTime updatedAt,
      NodeState state,
      @JsonKey(includeToJson: false, includeFromJson: false)
      List<Node> children,
      @JsonKey(includeToJson: false, includeFromJson: false)
      bool isDecryptionError});
}

/// @nodoc
class __$$FolderImplCopyWithImpl<$Res>
    extends _$NodeCopyWithImpl<$Res, _$FolderImpl>
    implements _$$FolderImplCopyWith<$Res> {
  __$$FolderImplCopyWithImpl(
      _$FolderImpl _value, $Res Function(_$FolderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parent = freezed,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? state = null,
    Object? children = null,
    Object? isDecryptionError = null,
  }) {
    return _then(_$FolderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as NodeState,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Node>,
      isDecryptionError: null == isDecryptionError
          ? _value.isDecryptionError
          : isDecryptionError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FolderImpl implements Folder {
  _$FolderImpl(
      {required this.id,
      this.parent,
      this.title = "",
      required this.createdAt,
      required this.updatedAt,
      required this.state,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final List<Node> children = const [],
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.isDecryptionError = false,
      final String? $type})
      : _children = children,
        $type = $type ?? 'folder';

  factory _$FolderImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderImplFromJson(json);

  @override
  final String id;
  @override
  final String? parent;
  @override
  @JsonKey()
  final String title;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final NodeState state;
  final List<Node> _children;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<Node> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final bool isDecryptionError;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Node.folder(id: $id, parent: $parent, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, state: $state, children: $children, isDecryptionError: $isDecryptionError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.isDecryptionError, isDecryptionError) ||
                other.isDecryptionError == isDecryptionError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      parent,
      title,
      createdAt,
      updatedAt,
      state,
      const DeepCollectionEquality().hash(_children),
      isDecryptionError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderImplCopyWith<_$FolderImpl> get copyWith =>
      __$$FolderImplCopyWithImpl<_$FolderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)
        $default, {
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            List<Node> children,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)
        folder,
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)
        note,
  }) {
    return folder(id, parent, title, createdAt, updatedAt, state, children,
        isDecryptionError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        $default, {
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            List<Node> children,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        folder,
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        note,
  }) {
    return folder?.call(id, parent, title, createdAt, updatedAt, state,
        children, isDecryptionError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        $default, {
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            List<Node> children,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        folder,
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        note,
    required TResult orElse(),
  }) {
    if (folder != null) {
      return folder(id, parent, title, createdAt, updatedAt, state, children,
          isDecryptionError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Node value) $default, {
    required TResult Function(Folder value) folder,
    required TResult Function(Note value) note,
  }) {
    return folder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Node value)? $default, {
    TResult? Function(Folder value)? folder,
    TResult? Function(Note value)? note,
  }) {
    return folder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Node value)? $default, {
    TResult Function(Folder value)? folder,
    TResult Function(Note value)? note,
    required TResult orElse(),
  }) {
    if (folder != null) {
      return folder(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FolderImplToJson(
      this,
    );
  }
}

abstract class Folder implements Node {
  factory Folder(
      {required final String id,
      final String? parent,
      final String title,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final NodeState state,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final List<Node> children,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final bool isDecryptionError}) = _$FolderImpl;

  factory Folder.fromJson(Map<String, dynamic> json) = _$FolderImpl.fromJson;

  @override
  String get id;
  @override
  String? get parent;
  @override
  String get title;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  NodeState get state;
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<Node> get children;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get isDecryptionError;
  @override
  @JsonKey(ignore: true)
  _$$FolderImplCopyWith<_$FolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoteImplCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$$NoteImplCopyWith(
          _$NoteImpl value, $Res Function(_$NoteImpl) then) =
      __$$NoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? parent,
      String title,
      DateTime createdAt,
      DateTime updatedAt,
      NodeState state,
      String content,
      @JsonKey(includeToJson: false, includeFromJson: false)
      bool isDecryptionError});
}

/// @nodoc
class __$$NoteImplCopyWithImpl<$Res>
    extends _$NodeCopyWithImpl<$Res, _$NoteImpl>
    implements _$$NoteImplCopyWith<$Res> {
  __$$NoteImplCopyWithImpl(_$NoteImpl _value, $Res Function(_$NoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parent = freezed,
    Object? title = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? state = null,
    Object? content = null,
    Object? isDecryptionError = null,
  }) {
    return _then(_$NoteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as NodeState,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isDecryptionError: null == isDecryptionError
          ? _value.isDecryptionError
          : isDecryptionError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoteImpl implements Note {
  _$NoteImpl(
      {required this.id,
      this.parent,
      this.title = "",
      required this.createdAt,
      required this.updatedAt,
      required this.state,
      this.content = "",
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.isDecryptionError = false,
      final String? $type})
      : $type = $type ?? 'note';

  factory _$NoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteImplFromJson(json);

  @override
  final String id;
  @override
  final String? parent;
  @override
  @JsonKey()
  final String title;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final NodeState state;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final bool isDecryptionError;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Node.note(id: $id, parent: $parent, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, state: $state, content: $content, isDecryptionError: $isDecryptionError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isDecryptionError, isDecryptionError) ||
                other.isDecryptionError == isDecryptionError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, parent, title, createdAt,
      updatedAt, state, content, isDecryptionError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      __$$NoteImplCopyWithImpl<_$NoteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)
        $default, {
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            List<Node> children,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)
        folder,
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)
        note,
  }) {
    return note(id, parent, title, createdAt, updatedAt, state, content,
        isDecryptionError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        $default, {
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            List<Node> children,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        folder,
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        note,
  }) {
    return note?.call(id, parent, title, createdAt, updatedAt, state, content,
        isDecryptionError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        $default, {
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
            List<Node> children,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        folder,
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content,
            @JsonKey(includeToJson: false, includeFromJson: false)
            bool isDecryptionError)?
        note,
    required TResult orElse(),
  }) {
    if (note != null) {
      return note(id, parent, title, createdAt, updatedAt, state, content,
          isDecryptionError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Node value) $default, {
    required TResult Function(Folder value) folder,
    required TResult Function(Note value) note,
  }) {
    return note(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Node value)? $default, {
    TResult? Function(Folder value)? folder,
    TResult? Function(Note value)? note,
  }) {
    return note?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Node value)? $default, {
    TResult Function(Folder value)? folder,
    TResult Function(Note value)? note,
    required TResult orElse(),
  }) {
    if (note != null) {
      return note(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteImplToJson(
      this,
    );
  }
}

abstract class Note implements Node {
  factory Note(
      {required final String id,
      final String? parent,
      final String title,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final NodeState state,
      final String content,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final bool isDecryptionError}) = _$NoteImpl;

  factory Note.fromJson(Map<String, dynamic> json) = _$NoteImpl.fromJson;

  @override
  String get id;
  @override
  String? get parent;
  @override
  String get title;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  NodeState get state;
  String get content;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get isDecryptionError;
  @override
  @JsonKey(ignore: true)
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
