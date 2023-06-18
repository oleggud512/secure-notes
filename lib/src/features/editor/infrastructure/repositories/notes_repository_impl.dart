import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/core/infrastructure/data_sources/database/database_provider.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart' as lite;
import '../../../../core/common/uuid.dart';
import '../../../../core/infrastructure/data_sources/database/database_utils.dart';
import '../../domain/entities/node/node.dart';
import '../../domain/entities/node/node_type.dart';
import '../../domain/repositories/node_repository.dart';

part 'notes_repository_impl.g.dart';

class LocalNotesRepositoryImpl implements NotesRepository { 
  lite.Database db;

  LocalNotesRepositoryImpl(this.db);

  @override
  Future<Either<AppException, Folder>> createFolder([String? parent]) async {
    if (!await _isFolder(parent)) return Left(ParentFolderException());
    final id = uuid();
    db.rawInsert('INSERT INTO nodes(id, type, parent) VALUES (?, ?, ?)', [id, DbNodeTypes.folder, parent]);
    return getNode<Folder>(id);
  }

  @override
  Future<Either<AppException, Note>> createNote([String? parent]) async {
    if (!await _isFolder(parent)) return Left(ParentFolderException());
    final id = uuid();
    db.rawInsert('INSERT INTO nodes(id, type, parent) VALUES (?, ?, ?)', [id, DbNodeTypes.note, parent]);
    db.rawInsert('INSERT INTO notes(nodeId) VALUES (?)', [id]);
    return getNode<Note>(id);
  }

  Future<bool> _isFolder(String? nodeId) async {
    if (nodeId == null) return true;
    final res = await db.rawQuery('SELECT type FROM nodes WHERE id = ?', [nodeId]);
    if (res.isEmpty || res[0][DbFields.nodes.type] != DbNodeTypes.folder) return false;
    return true;
  }

  Future<bool> _isExists(String nodeId) async {
    final res = await db.rawQuery('SELECT id FROM nodes WHERE id = ?', [nodeId]);
    return res.isNotEmpty;
  }

  @override
  Future<Either<AppException, void>> deleteNode(String id) async {
    final res = await db.rawDelete("""WITH RECURSIVE subnodes AS (
        SELECT id FROM nodes WHERE id = ?
        UNION
        SELECT t.id FROM nodes AS t
        JOIN subnodes AS s ON t.parent = s.id
      )
      DELETE FROM nodes WHERE id IN subnodes;""", [id]); // trigger handles note deletion
    if (res == 0) return Left(NotFoundException());
    return const Right(null);
  }

  @override
  Future<Either<AppException, T>> getNode<T extends Node>(String id) async {
    final res = await db.rawQuery('SELECT * FROM nodes LEFT JOIN notes ON nodes.id = notes.nodeId WHERE nodes.id = ?', [id]);
    if (res.isEmpty) return Left(NotFoundException());
    final node = Node.fromJson(res[0]);
    return Right(node as T);
  }

  @override
  Future<Either<AppException, List<Node>>> getSubfolders([String? folderId]) async {
    final res = await db.rawQuery('SELECT * FROM nodes WHERE nodes.parent ${folderId == null ? "IS NULL" : " = ?"}', [if (folderId != null) folderId]);
    final topLevel = res.map((e) => Node.fromJson(e)).toList();

    List<Node> result = [];

    for (final node in topLevel) {
      if (node is! Folder) {
        result.add(node);
        continue;
      }
      final subLevel = await getSubfolders(node.id);
      subLevel.map((right) {
        result.add(node.copyWith(children: right));
      });
    }

    return Right(result);
  }

  @override
  Future<Either<AppException, Folder>> updateFolder(Folder folder) async {
    if (!await _isExists(folder.id)) return Left(NotFoundException());
    if (!await _isFolder(folder.parent)) return Left(ParentFolderException());
    
    await db.rawUpdate('UPDATE nodes SET title = ?, parent = ?, state = ? WHERE id = ?', [folder.title, folder.parent, folder.state.name, folder.id]);

    return getNode<Folder>(folder.id);
  }

  @override
  Future<Either<AppException, Note>> updateNote(Note note) async {
    if (!await _isExists(note.id)) return Left(NotFoundException());
    if (!await _isFolder(note.parent)) return Left(ParentFolderException());
    
    await db.rawUpdate('UPDATE nodes SET title = ?, parent = ?, state = ? WHERE id = ?', [note.title, note.parent, note.state.name, note.id]);
    await db.rawUpdate('UPDATE notes SET content = ? WHERE nodeId = ?', [note.content, note.id]);

    return getNode<Note>(note.id);
  }
}

@riverpod
NotesRepository notesRepository(NotesRepositoryRef ref) {
  return LocalNotesRepositoryImpl(ref.watch(databaseProvider).value!);
}