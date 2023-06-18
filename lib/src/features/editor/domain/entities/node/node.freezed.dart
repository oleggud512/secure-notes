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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String? parent, String title,
            DateTime createdAt, DateTime updatedAt, NodeState state)
        $default, {
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
                List<Node> children)
        folder,
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content)
        note,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String? parent, String title,
            DateTime createdAt, DateTime updatedAt, NodeState state)?
        $default, {
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
                List<Node> children)?
        folder,
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content)?
        note,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String? parent, String title,
            DateTime createdAt, DateTime updatedAt, NodeState state)?
        $default, {
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
                List<Node> children)?
        folder,
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content)?
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
      NodeState state});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NodeCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$$_NodeCopyWith(_$_Node value, $Res Function(_$_Node) then) =
      __$$_NodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? parent,
      String title,
      DateTime createdAt,
      DateTime updatedAt,
      NodeState state});
}

/// @nodoc
class __$$_NodeCopyWithImpl<$Res> extends _$NodeCopyWithImpl<$Res, _$_Node>
    implements _$$_NodeCopyWith<$Res> {
  __$$_NodeCopyWithImpl(_$_Node _value, $Res Function(_$_Node) _then)
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
  }) {
    return _then(_$_Node(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Node implements _Node {
  _$_Node(
      {required this.id,
      this.parent,
      required this.title,
      required this.createdAt,
      required this.updatedAt,
      required this.state,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$_Node.fromJson(Map<String, dynamic> json) => _$$_NodeFromJson(json);

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

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Node(id: $id, parent: $parent, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Node &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, parent, title, createdAt, updatedAt, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NodeCopyWith<_$_Node> get copyWith =>
      __$$_NodeCopyWithImpl<_$_Node>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String? parent, String title,
            DateTime createdAt, DateTime updatedAt, NodeState state)
        $default, {
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
                List<Node> children)
        folder,
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content)
        note,
  }) {
    return $default(id, parent, title, createdAt, updatedAt, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String? parent, String title,
            DateTime createdAt, DateTime updatedAt, NodeState state)?
        $default, {
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
                List<Node> children)?
        folder,
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content)?
        note,
  }) {
    return $default?.call(id, parent, title, createdAt, updatedAt, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String? parent, String title,
            DateTime createdAt, DateTime updatedAt, NodeState state)?
        $default, {
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
                List<Node> children)?
        folder,
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content)?
        note,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, parent, title, createdAt, updatedAt, state);
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
    return _$$_NodeToJson(
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
      required final NodeState state}) = _$_Node;

  factory _Node.fromJson(Map<String, dynamic> json) = _$_Node.fromJson;

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
  @JsonKey(ignore: true)
  _$$_NodeCopyWith<_$_Node> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FolderCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$$FolderCopyWith(_$Folder value, $Res Function(_$Folder) then) =
      __$$FolderCopyWithImpl<$Res>;
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
          List<Node> children});
}

/// @nodoc
class __$$FolderCopyWithImpl<$Res> extends _$NodeCopyWithImpl<$Res, _$Folder>
    implements _$$FolderCopyWith<$Res> {
  __$$FolderCopyWithImpl(_$Folder _value, $Res Function(_$Folder) _then)
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
  }) {
    return _then(_$Folder(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Folder implements Folder {
  _$Folder(
      {required this.id,
      this.parent,
      this.title = "",
      required this.createdAt,
      required this.updatedAt,
      required this.state,
      @JsonKey(includeToJson: false, includeFromJson: false)
          final List<Node> children = const [],
      final String? $type})
      : _children = children,
        $type = $type ?? 'folder';

  factory _$Folder.fromJson(Map<String, dynamic> json) =>
      _$$FolderFromJson(json);

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

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Node.folder(id: $id, parent: $parent, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, state: $state, children: $children)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Folder &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, parent, title, createdAt,
      updatedAt, state, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderCopyWith<_$Folder> get copyWith =>
      __$$FolderCopyWithImpl<_$Folder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String? parent, String title,
            DateTime createdAt, DateTime updatedAt, NodeState state)
        $default, {
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
                List<Node> children)
        folder,
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content)
        note,
  }) {
    return folder(id, parent, title, createdAt, updatedAt, state, children);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String? parent, String title,
            DateTime createdAt, DateTime updatedAt, NodeState state)?
        $default, {
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
                List<Node> children)?
        folder,
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content)?
        note,
  }) {
    return folder?.call(
        id, parent, title, createdAt, updatedAt, state, children);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String? parent, String title,
            DateTime createdAt, DateTime updatedAt, NodeState state)?
        $default, {
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
                List<Node> children)?
        folder,
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content)?
        note,
    required TResult orElse(),
  }) {
    if (folder != null) {
      return folder(id, parent, title, createdAt, updatedAt, state, children);
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
    return _$$FolderToJson(
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
          final List<Node> children}) = _$Folder;

  factory Folder.fromJson(Map<String, dynamic> json) = _$Folder.fromJson;

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
  @JsonKey(ignore: true)
  _$$FolderCopyWith<_$Folder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoteCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$$NoteCopyWith(_$Note value, $Res Function(_$Note) then) =
      __$$NoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? parent,
      String title,
      DateTime createdAt,
      DateTime updatedAt,
      NodeState state,
      String content});
}

/// @nodoc
class __$$NoteCopyWithImpl<$Res> extends _$NodeCopyWithImpl<$Res, _$Note>
    implements _$$NoteCopyWith<$Res> {
  __$$NoteCopyWithImpl(_$Note _value, $Res Function(_$Note) _then)
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
  }) {
    return _then(_$Note(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Note implements Note {
  _$Note(
      {required this.id,
      this.parent,
      this.title = "",
      required this.createdAt,
      required this.updatedAt,
      required this.state,
      this.content = "",
      final String? $type})
      : $type = $type ?? 'note';

  factory _$Note.fromJson(Map<String, dynamic> json) => _$$NoteFromJson(json);

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

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Node.note(id: $id, parent: $parent, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, state: $state, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Note &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, parent, title, createdAt, updatedAt, state, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteCopyWith<_$Note> get copyWith =>
      __$$NoteCopyWithImpl<_$Note>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String? parent, String title,
            DateTime createdAt, DateTime updatedAt, NodeState state)
        $default, {
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
                List<Node> children)
        folder,
    required TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content)
        note,
  }) {
    return note(id, parent, title, createdAt, updatedAt, state, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String? parent, String title,
            DateTime createdAt, DateTime updatedAt, NodeState state)?
        $default, {
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
                List<Node> children)?
        folder,
    TResult? Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content)?
        note,
  }) {
    return note?.call(id, parent, title, createdAt, updatedAt, state, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String? parent, String title,
            DateTime createdAt, DateTime updatedAt, NodeState state)?
        $default, {
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            @JsonKey(includeToJson: false, includeFromJson: false)
                List<Node> children)?
        folder,
    TResult Function(
            String id,
            String? parent,
            String title,
            DateTime createdAt,
            DateTime updatedAt,
            NodeState state,
            String content)?
        note,
    required TResult orElse(),
  }) {
    if (note != null) {
      return note(id, parent, title, createdAt, updatedAt, state, content);
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
    return _$$NoteToJson(
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
      final String content}) = _$Note;

  factory Note.fromJson(Map<String, dynamic> json) = _$Note.fromJson;

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
  @JsonKey(ignore: true)
  _$$NoteCopyWith<_$Note> get copyWith => throw _privateConstructorUsedError;
}
