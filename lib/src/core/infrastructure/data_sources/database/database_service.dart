import 'package:editor_riverpod/src/core/common/constants/files.dart';
import 'package:editor_riverpod/src/core/infrastructure/data_sources/database/database_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseService {
  DatabaseService._();

  static DatabaseService? _instance;

  static DatabaseService get instance {
    _instance ??= DatabaseService._();
    return _instance!;
  }
  
  Future<Database> getNotesDatabase(String name) async {
    final p = await getApplicationDocumentsDirectory();
    // print('trying to open a database');
    final path = join(p.path, name);
    // await deleteDatabase(path);
    return openDatabase(path,
      version: 1,
      onCreate: (db, version) async {
        await DbCreationHelper.initializeDatabase(db);
      }
    );
  }

  Future<Database> getLocalDatabase() {
    return getNotesDatabase(DatabaseConstants.localDatabase);
  }

  Future<Database> getRemoteDatabase() {
    return getNotesDatabase(DatabaseConstants.remoteDatabase);
  }

}