import 'package:editor_riverpod/src/features/editor/application/exceptions.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/application/errors/exceptions.dart';
import '../../../../encryption/application/use_cases/encrypt_use_case.dart';

part 'encrypt_node_use_case.g.dart';

abstract interface class EncryptNodeUseCase {
  Future<Either<AppException, T>> call<T extends Node>(Node node);
}

class EncryptNodeUseCaseImpl implements EncryptNodeUseCase {
  EncryptUseCase encryptUseCase;

  EncryptNodeUseCaseImpl(this.encryptUseCase);
  
  @override
  Future<Either<AppException, T>> call<T extends Node>(Node node) async {
    if (node is Note) { 
      return Right(await encryptNote(node) as T);
    } else if (node is Folder) {
      return Right(await encryptFolder(node) as T);
    }
    return Left(EncryptionException());
  }

  Future<Folder> encryptFolder(Folder folder) async {
    final title = await encryptUseCase(folder.title);
    return folder.copyWith(title: title);
  }

  Future<Note> encryptNote(Note note) async {
    final title = await encryptUseCase(note.title);
    final content = await encryptUseCase(note.content);
    return note.copyWith(title: title, content: content);
  }


}

@riverpod
EncryptNodeUseCase encryptNodeUseCase(EncryptNodeUseCaseRef ref) {
  return EncryptNodeUseCaseImpl(ref.watch(encryptUseCaseProvider));
}