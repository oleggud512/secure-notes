import 'package:editor_riverpod/src/core/infrastructure/data_sources/database/database_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Database> database(DatabaseRef ref) {
  return DatabaseService.instance.getLocalDatabase();
}