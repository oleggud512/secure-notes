// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node_widget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NodeWidgetState {
  Node? get node => throw _privateConstructorUsedError;
  bool get isChildrenShown => throw _privateConstructorUsedError;
  List<Node> get nodes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NodeWidgetStateCopyWith<NodeWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeWidgetStateCopyWith<$Res> {
  factory $NodeWidgetStateCopyWith(
          NodeWidgetState value, $Res Function(NodeWidgetState) then) =
      _$NodeWidgetStateCopyWithImpl<$Res, NodeWidgetState>;
  @useResult
  $Res call({Node? node, bool isChildrenShown, List<Node> nodes});

  $NodeCopyWith<$Res>? get node;
}

/// @nodoc
class _$NodeWidgetStateCopyWithImpl<$Res, $Val extends NodeWidgetState>
    implements $NodeWidgetStateCopyWith<$Res> {
  _$NodeWidgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? node = freezed,
    Object? isChildrenShown = null,
    Object? nodes = null,
  }) {
    return _then(_value.copyWith(
      node: freezed == node
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as Node?,
      isChildrenShown: null == isChildrenShown
          ? _value.isChildrenShown
          : isChildrenShown // ignore: cast_nullable_to_non_nullable
              as bool,
      nodes: null == nodes
          ? _value.nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<Node>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NodeCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $NodeCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NodeWidgetStateImplCopyWith<$Res>
    implements $NodeWidgetStateCopyWith<$Res> {
  factory _$$NodeWidgetStateImplCopyWith(_$NodeWidgetStateImpl value,
          $Res Function(_$NodeWidgetStateImpl) then) =
      __$$NodeWidgetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Node? node, bool isChildrenShown, List<Node> nodes});

  @override
  $NodeCopyWith<$Res>? get node;
}

/// @nodoc
class __$$NodeWidgetStateImplCopyWithImpl<$Res>
    extends _$NodeWidgetStateCopyWithImpl<$Res, _$NodeWidgetStateImpl>
    implements _$$NodeWidgetStateImplCopyWith<$Res> {
  __$$NodeWidgetStateImplCopyWithImpl(
      _$NodeWidgetStateImpl _value, $Res Function(_$NodeWidgetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? node = freezed,
    Object? isChildrenShown = null,
    Object? nodes = null,
  }) {
    return _then(_$NodeWidgetStateImpl(
      node: freezed == node
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as Node?,
      isChildrenShown: null == isChildrenShown
          ? _value.isChildrenShown
          : isChildrenShown // ignore: cast_nullable_to_non_nullable
              as bool,
      nodes: null == nodes
          ? _value._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<Node>,
    ));
  }
}

/// @nodoc

class _$NodeWidgetStateImpl implements _NodeWidgetState {
  _$NodeWidgetStateImpl(
      {this.node,
      this.isChildrenShown = false,
      final List<Node> nodes = const []})
      : _nodes = nodes;

  @override
  final Node? node;
  @override
  @JsonKey()
  final bool isChildrenShown;
  final List<Node> _nodes;
  @override
  @JsonKey()
  List<Node> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  @override
  String toString() {
    return 'NodeWidgetState(node: $node, isChildrenShown: $isChildrenShown, nodes: $nodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NodeWidgetStateImpl &&
            (identical(other.node, node) || other.node == node) &&
            (identical(other.isChildrenShown, isChildrenShown) ||
                other.isChildrenShown == isChildrenShown) &&
            const DeepCollectionEquality().equals(other._nodes, _nodes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, node, isChildrenShown,
      const DeepCollectionEquality().hash(_nodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NodeWidgetStateImplCopyWith<_$NodeWidgetStateImpl> get copyWith =>
      __$$NodeWidgetStateImplCopyWithImpl<_$NodeWidgetStateImpl>(
          this, _$identity);
}

abstract class _NodeWidgetState implements NodeWidgetState {
  factory _NodeWidgetState(
      {final Node? node,
      final bool isChildrenShown,
      final List<Node> nodes}) = _$NodeWidgetStateImpl;

  @override
  Node? get node;
  @override
  bool get isChildrenShown;
  @override
  List<Node> get nodes;
  @override
  @JsonKey(ignore: true)
  _$$NodeWidgetStateImplCopyWith<_$NodeWidgetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
