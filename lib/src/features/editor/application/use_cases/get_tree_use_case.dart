import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/encryption/decrypt_node_use_case.dart';
import 'package:editor_riverpod/src/features/editor/domain/repositories/node_repository.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/repositories/notes_repository_impl.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/node/node.dart';

part 'get_tree_use_case.g.dart';

class GetSubfoldersUseCase {
  final NotesRepository repo;
  final DecryptNodeUseCase decryptNodeUseCase;

  GetSubfoldersUseCase(this.repo, this.decryptNodeUseCase);

  Future<Either<AppException, List<Node>>> call([String? folderId]) async {
    final nodes = await repo.getSubfolders(folderId);
    final decrypted = await nodes.thenAsync((nodes) {
      return _decrypt(nodes);
    });
    return decrypted;
  }

  Future<Either<AppException, List<Node>>> _decrypt(List<Node> nodes) async {

    List<Node> result = [];

    for (final node in nodes) {
      if (node is! Folder) {
        final decryptedNode = await decryptNodeUseCase.call(node);
        decryptedNode.map((right) => result.add(right));
        continue;
      }
      final decryptedNode = await decryptNodeUseCase.call<Folder>(node);
      final children = await _decrypt(node.children);
      children.map((children) {
        decryptedNode.map((folder) {
          result.add(folder.copyWith(children: children));
        });
      });
    }

    return Right(result);
  }
}

@riverpod
GetSubfoldersUseCase getSubfoldersUseCase(GetSubfoldersUseCaseRef ref) {
  return GetSubfoldersUseCase(ref.watch(notesRepositoryProvider), ref.watch(decryptNodeUseCaseProvider));
}