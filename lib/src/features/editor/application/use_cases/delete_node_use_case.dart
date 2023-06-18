import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/features/editor/domain/repositories/node_repository.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/repositories/notes_repository_impl.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_node_use_case.g.dart';

class DeleteNodeUseCase {
  final NotesRepository repo;

  DeleteNodeUseCase(this.repo);
  
  Future<Either<AppException, void>> call(String id) async {
    return repo.deleteNode(id);
  }
}

@riverpod
DeleteNodeUseCase deleteNodeUseCase(DeleteNodeUseCaseRef ref) {
  return DeleteNodeUseCase(ref.watch(notesRepositoryProvider));
}