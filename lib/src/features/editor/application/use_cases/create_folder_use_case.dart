import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node.dart';
import 'package:editor_riverpod/src/features/editor/domain/repositories/node_repository.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/repositories/notes_repository_impl.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_folder_use_case.g.dart';

class CreateFolderUseCase {
  final NotesRepository repo;

  CreateFolderUseCase(this.repo);

  Future<Either<AppException, Folder>> call([String? parent]) async {
    final created = await repo.createFolder(parent);
    return created;
  }
}

@riverpod
CreateFolderUseCase createFolderUseCase(CreateFolderUseCaseRef ref) {
  return CreateFolderUseCase(ref.watch(notesRepositoryProvider));
}