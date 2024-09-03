import 'package:editor_riverpod/src/app.dart';
import 'package:editor_riverpod/src/core/infrastructure/data_sources/database/database_provider.dart';
import 'package:editor_riverpod/src/core/presentation/theme/theme_mode_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // nothing
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer(
    overrides: []
  );

  // initialize database
  final db = await container.read(databaseProvider.future);
  await container.read(themeModeControllerProvider.notifier).init();

  // await container.read(secureStorageProvider).delete(StorageKeys.hashedPassword);
  // await container.read(secureStorageProvider).delete(StorageKeys.decryptedPrivateKey);
  // await container.read(secureStorageProvider).delete(StorageKeys.encryptedPrivateKey);
  // await container.read(secureStorageProvider).delete(StorageKeys.publicKey);
  // await FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true)).deleteAll();
  // await db.rawDelete('DELETE FROM notes');
  // await db.rawDelete('DELETE FROM nodes');
  // print(JsonEncoder.withIndent('  ').convert(await db.rawQuery('SELECT id, type, parent, state FROM nodes LEFT JOIN notes ON nodes.id = notes.nodeId')));

  runApp(UncontrolledProviderScope(
    container: container,
    child: const MyApp()
  ));
}
