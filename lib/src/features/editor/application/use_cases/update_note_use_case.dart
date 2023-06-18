import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/encryption/decrypt_node_use_case.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/encryption/encrypt_node_use_case.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node.dart';
import 'package:editor_riverpod/src/features/editor/domain/repositories/node_repository.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/repositories/notes_repository_impl.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_note_use_case.g.dart';

class UpdateNoteUseCase {
  final NotesRepository repo;
  final EncryptNodeUseCase encryptNodeUseCase;
  final DecryptNodeUseCase decryptNodeUseCase;

  UpdateNoteUseCase(this.repo, this.encryptNodeUseCase, this.decryptNodeUseCase);

  Future<Either<AppException, Note>> call(Note note) async {
    final encrypted = await encryptNodeUseCase.call<Note>(note);
    final updated = await encrypted.thenAsync((right) {
      return repo.updateNote(right);
    });
    final decrypted = await updated.thenAsync((right) {
      return decryptNodeUseCase.call<Note>(right);
    });
    return decrypted;
  }
}

@riverpod
UpdateNoteUseCase updateNoteUseCase(UpdateNoteUseCaseRef ref) {
  return UpdateNoteUseCase(
    ref.watch(notesRepositoryProvider), 
    ref.watch(encryptNodeUseCaseProvider),
    ref.watch(decryptNodeUseCaseProvider),
  );
}