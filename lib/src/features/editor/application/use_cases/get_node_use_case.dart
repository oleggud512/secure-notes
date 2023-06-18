import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/encryption/decrypt_node_use_case.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node.dart';
import 'package:editor_riverpod/src/features/editor/domain/repositories/node_repository.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infrastructure/repositories/notes_repository_impl.dart';

part 'get_node_use_case.g.dart';

class GetNodeUseCase {
  NotesRepository repo;
  DecryptNodeUseCase decryptNodeUseCase;

  GetNodeUseCase(this.repo, this.decryptNodeUseCase);

  Future<Either<AppException, T>> call<T extends Node>(String id) async {
    final encrypted = await repo.getNode(id);

    final decrypted = encrypted.thenAsync((r) {
      return decryptNodeUseCase.call<T>(r);
    });
    return decrypted;
  }
}

@riverpod
GetNodeUseCase getNodeUseCase(GetNodeUseCaseRef ref) {
  return GetNodeUseCase(
    ref.watch(notesRepositoryProvider), 
    ref.watch(decryptNodeUseCaseProvider))
  ;
}