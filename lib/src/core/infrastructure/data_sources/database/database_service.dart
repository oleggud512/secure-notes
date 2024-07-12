import 'dart:io';

import 'package:editor_riverpod/src/core/common/constants/files.dart';
import 'package:editor_riverpod/src/core/infrastructure/data_sources/database/database_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


class DatabaseService {
  DatabaseService._();

  static DatabaseService? _instance;

  static DatabaseService get instance {
    _instance ??= DatabaseService._();
    return _instance!;
  }
  
  Future<Database> getNotesDatabase(String name) async {
    if (Platform.isWindows) {
      databaseFactory = databaseFactoryFfi;
    }
    
    final p = await getApplicationDocumentsDirectory();
    // print('trying to open a database');
    final path = join(p.path, name);
    // await deleteDatabase(path);
    return openDatabase(path,
      version: 1,
      onCreate: (db, version) async {
        await DbCreationHelper.initializeDatabaseSchema(db);
      }
    );
  }

  Future<Database> getLocalDatabase() {
    return getNotesDatabase(DatabaseConstants.localDatabase);
  }

  Future<Database> getRemoteDatabase() {
    // TODO: no remote database
    return getNotesDatabase(DatabaseConstants.remoteDatabase);
  }

}