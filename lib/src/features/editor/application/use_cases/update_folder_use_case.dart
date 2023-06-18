import 'package:editor_riverpod/src/features/editor/application/use_cases/encryption/decrypt_node_use_case.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/repositories/notes_repository_impl.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/application/errors/exceptions.dart';
import '../../domain/entities/node/node.dart';
import '../../domain/repositories/node_repository.dart';
import 'encryption/encrypt_node_use_case.dart';

part 'update_folder_use_case.g.dart';

class UpdateFolderUseCase {
  final NotesRepository repo;
  final EncryptNodeUseCase encryptNodeUseCase;
  final DecryptNodeUseCase decryptNodeUseCase;

  UpdateFolderUseCase(
    this.repo, 
    this.encryptNodeUseCase, 
    this.decryptNodeUseCase
  );

  Future<Either<AppException, Folder>> call(Folder note) async {
    final encrypted = await encryptNodeUseCase.call<Folder>(note);
    final updated = await encrypted.thenAsync((right) {
      return repo.updateFolder(right);
    });
    final decrypted = await updated.thenAsync((right) {
      return decryptNodeUseCase.call<Folder>(right);
    });
    return decrypted;
  }
}

@riverpod
UpdateFolderUseCase updateFolderUseCase(UpdateFolderUseCaseRef ref) {
  return UpdateFolderUseCase(
    ref.watch(notesRepositoryProvider), 
    ref.watch(encryptNodeUseCaseProvider),
    ref.watch(decryptNodeUseCaseProvider),
  );
}