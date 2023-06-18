import 'package:editor_riverpod/src/features/editor/domain/entities/node/node.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'editor_widget_state.freezed.dart';

@freezed
class EditorWidgetState with _$EditorWidgetState {
  factory EditorWidgetState({
    Note? note
  }) = _EditorWidgetState;
}