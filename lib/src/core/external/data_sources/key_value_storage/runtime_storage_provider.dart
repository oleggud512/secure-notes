import 'package:editor_riverpod/src/core/infrastructure/data_sources/key_value_storage/key_value_storage_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'runtime_storage_impl.dart';
import 'secure_storage_provider.dart';

part 'runtime_storage_provider.g.dart';

@Riverpod(keepAlive: true)
KeyValueStorageDataSource runtimeStorage(RuntimeStorageRef ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return RuntimeStorage(secureStorage);
}