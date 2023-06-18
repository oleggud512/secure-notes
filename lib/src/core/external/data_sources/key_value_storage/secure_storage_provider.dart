import 'package:editor_riverpod/src/core/infrastructure/data_sources/key_value_storage/key_value_storage_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'secure_storage_impl.dart';

part 'secure_storage_provider.g.dart';

@Riverpod(keepAlive: true)
KeyValueStorageDataSource secureStorage(SecureStorageRef ref) {
  return SecureStorageImpl();
}