import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node.dart';
import 'package:editor_riverpod/src/features/editor/domain/repositories/node_repository.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/repositories/notes_repository_impl.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_note_use_case.g.dart';

class CreateNoteUseCase {
  final NotesRepository repo;

  CreateNoteUseCase(this.repo);

  Future<Either<AppException, Note>> call([String? parent]) async {
    final created = await repo.createNote(parent); // ...with no data, so it doesn't need to be encrypted.
    return created;
  }
}

@riverpod
CreateNoteUseCase createNoteUseCase(CreateNoteUseCaseRef ref) {
  return CreateNoteUseCase(ref.watch(notesRepositoryProvider));
}