import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/get_node_use_case.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/update_note_use_case.dart';
import 'package:editor_riverpod/src/features/editor/presentation/editor/editor_widget_state.dart';
import 'package:either_dart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/providers/curret_note_provider.dart';
import '../../domain/entities/node/node.dart';
import '../../presentation/editor/editor_widget_controller.dart';

part 'editor_widget_controller_impl.g.dart';

@riverpod
class EditorWidgetControllerImpl extends _$EditorWidgetControllerImpl
    implements EditorWidgetController {

  GetNodeUseCase get _getNodeUseCase => ref.watch(getNodeUseCaseProvider);
  UpdateNoteUseCase get _updateNoteUseCase => ref.watch(updateNoteUseCaseProvider);
  
  @override
  FutureOr<EditorWidgetState> build() async {
    final noteId = ref.watch(currentNoteProvider);
    return EditorWidgetState(
      note: noteId == null 
        ? null 
        : (await _getNodeUseCase.call<Note>(noteId)).right
    );
  }

  @override
  Future<Either<AppException, String>> updateContent(String newContent) async {
    final newNote = state.value!.note!.copyWith(content: newContent);
    final updated = await _updateNoteUseCase.call(newNote);
    return updated.map((r) {
      state = AsyncData(state.value!.copyWith(note: r));
      return r.content;
    });
  }

  @override
  Future<Either<AppException, String>> updateTitle(String newTitle) async {
    final newNote = state.value!.note!.copyWith(title: newTitle);
    final updated = await _updateNoteUseCase.call(newNote);
    return updated.map((r) {
      state = AsyncData(state.value!.copyWith(note: r));
      return r.title;
    });
  }

  
}