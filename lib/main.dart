import 'dart:convert';
import 'dart:developer';

import 'package:editor_riverpod/src/app.dart';
import 'package:editor_riverpod/src/core/infrastructure/data_sources/database/database_provider.dart';
import 'package:editor_riverpod/src/core/presentation/theme/theme_mode_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer(
    overrides: []
  );

  // initialize database
  final db = await container.read(databaseProvider.future);
  await container.read(themeModeControllerProvider.notifier).init();
  // await FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true)).deleteAll();
  // await db.rawDelete('DELETE FROM notes');
  // await db.rawDelete('DELETE FROM nodes');
  // print(JsonEncoder.withIndent('  ').convert(await db.rawQuery('SELECT id, type, parent, state FROM nodes LEFT JOIN notes ON nodes.id = notes.nodeId')));

  runApp(UncontrolledProviderScope(
    container: container,
    child: const MyApp()
  ));
  // в нового бро перешел бро, у которого parent уже был старый новый бро. 
  // Поэтому старый (новый) parent изменился на старый (новый) parent и 
  // старый (новый) parent обновился 2 раза подряд - новый (старый) parent вообще не заторнуло. 
  // Где странность?
  // В том что в старом parent был child с другим parent. 
  // Откуда он там взялся?
  // Ну, он туда мог прийти от старого parent. 
  // Но оно же не добавляет вручную - оно получает новое дерево.
  // Когда передаешь в первый раз в нового, то он становится туда без проблем. Нужно проверить с каким parent там child. 


  // нужно просто создать новый note, потому что будет использоваться 
  // новый контроллер, а не старый. Все из-за того что используется старый 
  // контроллер для перемещенного виджета. Хмм... Тогда... Нужно просто 
  // обратиться к виджету который переместили, и обновить его состояние. Ага. 
}