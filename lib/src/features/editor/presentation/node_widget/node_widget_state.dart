import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/node/node.dart';

part 'node_widget_state.freezed.dart';

@freezed
class NodeWidgetState with _$NodeWidgetState {
  factory NodeWidgetState({
    Node? node,
    @Default(false) bool isChildrenShown,
    @Default([]) List<Node> nodes
  }) = _NodeWidgetState;
}