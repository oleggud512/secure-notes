import 'package:either_dart/either.dart';

import '../../../../core/application/errors/exceptions.dart';
import '../entities/node/node.dart';

abstract interface class NotesRepository {
  Future<Either<AppException, Node>> getNode<T extends Node>(String id);
  Future<Either<AppException, void>> deleteNode(String id);
  
  Future<Either<AppException, Note>> createNote([String? parent]);
  Future<Either<AppException, Folder>> createFolder([String? parent]);

  Future<Either<AppException, Note>> updateNote(Note note);
  Future<Either<AppException, Folder>> updateFolder(Folder folder);
  
  Future<Either<AppException, List<Node>>> getSubfolders([String? folderId]);
}
