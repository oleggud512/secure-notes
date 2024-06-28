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
      return await decryptNote(node) as Either<AppException, T>;
    } else if (node is Folder) {
      return await decryptFolder(node) as Either<AppException, T>;
    }
    return Left(EncryptionException());
  }

  Future<Either<AppException, Folder>> decryptFolder(Folder folder) async {
    final title = await decryptUseCase(folder.title);

    return title.fold(
      (left) {
        return Right(folder.copyWith(
          isDecryptionError: true,
          title: "(f) decr err"
        ));
      },
      (right) {
        return Right(folder.copyWith(
          title: right
        ));
      }
    );
  }

  Future<Either<AppException, Note>> decryptNote(Note note) async {
    final title = await decryptUseCase(note.title);
    final content = await decryptUseCase(note.content);

    var resNote = note.copyWith();

    title.fold(
      (left) {
        resNote = resNote.copyWith(
          isDecryptionError: true,
          title: "(nt) decr err"
        );
      },
      (right) {
        resNote = resNote.copyWith(
          title: right
        );
      }
    );

    content.fold(
      (left) {
        resNote = resNote.copyWith(
          isDecryptionError: true,
          content: "(nc) decr err"
        );
      },
      (right) {
        resNote = resNote.copyWith(
          content: right
        );
      }
    );

    return Right(resNote);
  }

}


@riverpod
DecryptNodeUseCase decryptNodeUseCase(DecryptNodeUseCaseRef ref) {
  return DecryptNodeUseCaseImpl(
    ref.watch(decryptUseCaseProvider)
  );
}