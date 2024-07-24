import 'package:editor_riverpod/src/features/editor/application/use_cases/get_node_use_case.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'curret_note_provider.g.dart';

@riverpod
class CurrentNote extends _$CurrentNote {

  @override
  String? build() {
    return null;
  }

  void setCurrentNote(String? id) {
    state = id;
  }
}