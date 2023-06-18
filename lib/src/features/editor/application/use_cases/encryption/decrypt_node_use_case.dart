import 'package:editor_riverpod/src/features/encryption/application/use_cases/decrypt_use_case.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/application/errors/exceptions.dart';
import '../../../domain/entities/node/node.dart';
import '../../exceptions.dart';

part 'decrypt_node_use_case.g.dart';

abstract interface class DecryptNodeUseCase {
  Future<Either<AppException, T>> call<T extends Node>(Node node);
}

class DecryptNodeUseCaseImpl implements DecryptNodeUseCase {
  final DecryptUseCase decryptUseCase;

  const DecryptNodeUseCaseImpl(this.decryptUseCase);

  @override
  Future<Either<AppException, T>> call<T extends Node>(Node node) async {
    if (node is Note) { 
      return Right(await decryptNote(node) as T);
    } else if (node is Folder) {
      return Right(await decryptFolder(node) as T);
    }
    return Left(EncryptionException());
  }

  Future<Folder> decryptFolder(Folder folder) async {
    final title = await decryptUseCase(folder.title);
    return folder.copyWith(title: title);
  }

  Future<Note> decryptNote(Note note) async {
    final title = await decryptUseCase(note.title);
    final content = await decryptUseCase(note.content);
    return note.copyWith(title: title, content: content);
  }

}


@riverpod
DecryptNodeUseCase decryptNodeUseCase(DecryptNodeUseCaseRef ref) {
  return DecryptNodeUseCaseImpl(
    ref.watch(decryptUseCaseProvider)
  );
}