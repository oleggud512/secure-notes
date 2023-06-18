import 'dart:io';

import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/core/common/uuid.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node_state.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node_type.dart';
import 'package:editor_riverpod/src/features/editor/domain/repositories/node_repository.dart';
import 'package:editor_riverpod/src/core/infrastructure/data_sources/database/database_utils.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/repositories/notes_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path_util;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfi;

  const dbName = 'go.db';
  late NotesRepository sut;
  late Database db;

  setUp(() async {
    final temp = await Directory.systemTemp.create();

    db = await openDatabase(path_util.join(temp.path, dbName),
      version: 1,
      onCreate: (db, version) async {
        await DbCreationHelper.initializeDatabase(db);
      },
    );

    sut = LocalNotesRepositoryImpl(db);
  });

  tearDown(() async {
    await deleteDatabase(db.path);
    await db.close();
  });

  setUpAll(() async {
    final temp = await Directory.systemTemp.create();
    // temp.listSync().forEach((element) { print(path_util.basename(element.path));});
    await deleteDatabase(path_util.join(temp.path, 'go.db'));
    print('setUpAll');
  });

  tearDownAll(() {
    print('tearDownAll');
  });

  group('getNode(String id)', () {

    test('return a Note', () async {
      final id = uuid();
      const title = "some title";
      const content = 'some content';

      await db.rawInsert("INSERT INTO nodes(id, type, title) VALUES (?, ?, ?)", [id, DbNodeTypes.note, title]);
      await db.rawInsert("INSERT INTO notes(nodeId, content) VALUES (?, ?)", [id, content]);

      final node = await sut.getNode(id);

      expect(node.isRight, true);
      node.map((r) {
        expect(r, isA<Note>());
        expect((r as Note).content, content);
        expect(r.title, title);
      });
    });

    test('return a Folder', () async {
      final id = uuid();
      const title = "some title";

      await db.rawInsert("INSERT INTO nodes(id, type, title) VALUES (?, ?, ?)", [id, DbNodeTypes.folder, title]);

      final node = await sut.getNode(id);

      expect(node.isRight, isTrue);
      node.map((r) {
        expect(r, isA<Folder>());
        expect(r.title, title);
      });
    });
    

    test('return Left(NotFoundException) if not found', () async {
      final node = await sut.getNode("no id");
      expect(node.isLeft, isTrue);
      node.mapLeft((l) {
        expect(l, isA<NotFoundException>());
      });
    });

  });

  group('createNote/Folder([String? parent])', () {

    test('create an empty, top level note', () async {
      final note = await sut.createNote();

      expect(note.isRight, isTrue);

      note.map((note) {
        expect(note.id, isNotEmpty);
        expect(note.content, isEmpty);
        expect(note.parent, isNull);
      });
    });

    test('create an empty, top level folder', () async {
      final folder = await sut.createFolder();

      expect(folder.isRight, isTrue);

      folder.map((folder) {
        expect(folder.id, isNotEmpty);
        expect(folder.title, isEmpty);
        expect(folder.parent, isNull);
      });
    });

    test('create an empty note inside a folder', () async {
      final parent = await sut.createFolder();

      final child = await parent.thenAsync((parent) async {
        final note = await sut.createNote(parent.id);
        return note;
      });

      child.map((child) {
        expect(child, isA<Note>());
        expect(child.parent, parent.right.id); // I am able to do it right now because I already tested createFolder method, and am sure it's right.
      });

    });

    test('create an empty folder inside a folder', () async {
      final parent = await sut.createFolder();

      final child = await parent.thenAsync((parent) async {
        final note = await sut.createFolder(parent.id);
        return note;
      });

      child.map((child) {
        expect(child, isA<Folder>());
        expect(child.parent, parent.right.id);
      });
    });

    test('return NonFolderParentException when parent is not a folder', () async {
      final parent = await sut.createNote();
      final note = await parent.thenAsync((right) {
        return sut.createNote(right.id);
      });
      final folder = await parent.thenAsync((right) {
        return sut.createFolder(right.id);
      });

      expect(note.isLeft, isTrue);
      expect(folder.isLeft, isTrue);
      note.mapLeft((left) {
        expect(left, isA<ParentFolderException>());
      });
      folder.mapLeft((left) {
        expect(left, isA<ParentFolderException>());
      });
    });

  });

  group('getTree()', () {

    test('test getTree()', () async {
      final topF1 = await sut.createFolder();
      final topN1 = await sut.createNote();
      final subF1 = await topF1.thenAsync((right) async {
        return sut.createFolder(right.id);
      });
      final subN1 = await topF1.thenAsync((right) async {
        return sut.createNote(right.id);
      });
      final subSubN1 = await subF1.thenAsync((right) async {
        return sut.createNote(right.id);
      });

      final root = await sut.getSubfolders();

      root.map((root) {
        final topF1Tree = root.firstWhere((n) => n is Folder);
        expect(topF1Tree.id, topF1.right.id);
        final topN1Tree = root.firstWhere((n) => n is Note);
        expect(topN1Tree.id, topN1.right.id);
        final subF1Tree = (topF1Tree as Folder).children.firstWhere((n) => n is Folder);
        expect(subF1Tree.id, subF1.right.id);
        final subN1Tree = topF1Tree.children.firstWhere((n) => n is Note);
        expect(subN1Tree.id, subN1.right.id);
        final subSubN1Tree = (subF1Tree as Folder).children.firstWhere((n) => n is Note);
        expect(subSubN1Tree.id, subSubN1.right.id);
      });

    });
  });

  group('update', () {

    test('update', () async {
      final parent = await sut.createFolder();
      final note = await sut.createNote();
      final folder = await sut.createFolder();

      const newTitle = 'some title';
      const newContent = 'some content';
      const newState = NodeState.deleted;

      final updateResultNote = await note.thenAsync((right) async {
        return sut.updateNote(right.copyWith(
          title: newTitle, 
          content: newContent, 
          parent: parent.right.id,
          state: newState
        ));
      });

      final updateResultFolder = await folder.thenAsync((right) async {
        return sut.updateFolder(right.copyWith(title: newTitle, state: newState));
      });

      expect(updateResultNote.isRight, isTrue);

      expect(updateResultNote.right.content, newContent);
      expect(updateResultNote.right.title, newTitle);
      expect(updateResultNote.right.state, newState);
      expect(updateResultNote.right.parent, parent.right.id);

      expect(updateResultFolder.isRight, isTrue);

      expect(updateResultFolder.right.title, newTitle);
      expect(updateResultFolder.right.state, newState);
      expect(updateResultFolder.right.parent, isNull);
    });

    test('return ParentFolderException', () async {
      final note = await sut.createNote();
      final folder = await sut.createFolder();
      
      final updateResultNote = await note.thenAsync((right) async {
        return sut.updateNote(right.copyWith(parent: "no id"));
      });
      final updateResultFolder = await folder.thenAsync((right) async {
        return sut.updateFolder(right.copyWith(parent: "no id"));
      });

      expect(updateResultNote.isLeft, isTrue);
      expect(updateResultNote.left, isA<ParentFolderException>());

      expect(updateResultFolder.isLeft, isTrue);
      expect(updateResultFolder.left, isA<ParentFolderException>());
    });

    test('return NotFoundException', () async {
      final updateResultNote = await sut.updateNote(Note(id: 'id', createdAt: DateTime.now(), updatedAt: DateTime.now(), state: NodeState.created));
      final updateResultFolder = await sut.updateFolder(Folder(id: '', createdAt: DateTime.now(), updatedAt: DateTime.now(), state: NodeState.created));

      expect(updateResultNote.isLeft, isTrue);
      updateResultNote.mapLeft((left) {
        expect(left, isA<NotFoundException>());
      });
      expect(updateResultFolder.isLeft, isTrue);
      updateResultFolder.mapLeft((left) {
        expect(left, isA<NotFoundException>());
      });
    });
  });

  group('delete', () {
    test('delete', () async {
      final folder = await sut.createFolder();

      final note = await sut.createNote(folder.right.id);

      expect(note.isRight, isTrue);

      sut.deleteNode(folder.right.id);

      final deletedFolder = await sut.getNode(folder.right.id);
      final deletedNote = await sut.getNode(note.right.id);

      expect(deletedFolder.isLeft, isTrue);
      expect(deletedNote.isLeft, isTrue);
    });

    test('return NotFoundException', () async {
      final deleted = await sut.deleteNode('some');

      expect(deleted.isLeft, isTrue);
      deleted.mapLeft((left) {
        expect(left, isA<NotFoundException>());
      });
    });
  });
}