import 'dart:async';

import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/core/common/loggler.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/get_node_use_case.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/update_note_use_case.dart';
import 'package:editor_riverpod/src/features/editor/presentation/editor/editor_widget_state.dart';
import 'package:editor_riverpod/src/features/local_auth/application/auth_service_provider.dart';
import 'package:editor_riverpod/src/features/local_auth/application/services/auth_service.dart';
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
  String? get _currentNote => ref.watch(currentNoteProvider);
  AuthService get _authService => ref.watch(authServiceProvider);

  StreamSubscription<void>? _passwordChangeStream;

  void _passwordChangeListener(void _) async {
    final noteId = _currentNote;
    if (noteId == null) return;
    final note = await getNote(noteId);
    state = AsyncData(state.value!.copyWith(note: note));
  }
  
  @override
  FutureOr<EditorWidgetState> build() async {
    final noteId = _currentNote;
    _passwordChangeStream = _authService.watchPasswordChange()
      .listen(_passwordChangeListener);
    ref.onDispose(() {
      _passwordChangeStream?.cancel();
    });

    if (noteId == null) {
      return EditorWidgetState(note: null);
    }

    final note = await getNote(noteId);
    return EditorWidgetState(note: note);
  }

  Future<Note?> getNote(String noteId) async {
    final res = await _getNodeUseCase.call<Note>(noteId);
    return res.fold(
      (left) {
        return null;
      },
      (right) {
        return right;
      }
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