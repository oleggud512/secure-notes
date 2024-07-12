import 'package:sqflite/sqflite.dart';

class DbTables {
  static const String nodes = 'nodes';
  static const String notes = 'notes';
}

class DbFields {
  static final notes = _NotesDbFields();
  static final nodes = _NodesDbFields();
}

class _NotesDbFields {
  final String nodeId = 'nodeId';
  final String content = 'content';
}

class _NodesDbFields {
  final String id = 'id';
  final String type = 'type';
  final String state = 'state';
  final String title = 'title';
  final String parent = 'parent';
  final String updatedAt = 'updatedAt';
  final String createdAt = 'createdAt';
}

class DbCreationHelper {
  static const String createNodesTable = """
    CREATE TABLE nodes (
      id        TEXT NOT NULL PRIMARY KEY,
      type      TEXT NOT NULL CHECK(type IN ('folder', 'note')),
      state     TEXT NOT NULL DEFAULT('created') CHECK(state IN ('created', 'deleted', 'unchanged', 'updated')),
      parent    TEXT     NULL,
      title     TEXT NOT NULL DEFAULT(''),
      updatedAt TEXT NOT NULL DEFAULT(DATETIME()),
      createdAt TEXT NOT NULL DEFAULT(DATETIME()),

    FOREIGN KEY (parent) REFERENCES nodes (id)
    )
  """;
  static const String createNotesTable = """
    CREATE TABLE notes (
      nodeId TEXT NOT NULL PRIMARY KEY,
      content TEXT NOT NULL DEFAULT(''),

      FOREIGN KEY (nodeId) REFERENCES nodes (id)
    )
  """;
  static const String deleteNoteWithNode = """
    CREATE TRIGGER IF NOT EXISTS delete_note_with_node
    AFTER DELETE ON nodes
    BEGIN 
      DELETE FROM notes WHERE nodeId = OLD.id;
    END
  """;
  static const String createNodesUpdatedAtUpdateTrigger = """
    CREATE TRIGGER IF NOT EXISTS update_nodes_updated_at 
    AFTER UPDATE ON nodes
    BEGIN
      UPDATE nodes 
      SET updatedAt = DATETIME() 
      WHERE id = OLD.id;
    END
  """;
  static const String createNotesUpdatedAtUpdateTrigger = """
    CREATE TRIGGER IF NOT EXISTS update_notes_updated_at 
    AFTER UPDATE ON notes
    BEGIN
      UPDATE nodes
      SET updatedAt = DATETIME() 
      WHERE id = OLD.nodeId;
    END
  """;

  static const List<String> creationSequence = [
    createNodesTable,
    createNotesTable,
    deleteNoteWithNode,
    createNotesUpdatedAtUpdateTrigger,
    createNodesUpdatedAtUpdateTrigger,
  ];

  static Future<void> initializeDatabaseSchema(Database db) async {
    for (final script in creationSequence) {
      await db.execute(script);
    }
  }
}