import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../infrastructure/data_sources/key_value_storage/key_value_storage_data_source.dart';

class SecureStorageImpl implements KeyValueStorageDataSource {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  @override
  Future<String?> read(String key) {
    return storage.read(key: key);

  }

  @override
  Future<void> write(String key, String value) async {
    final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
    await storage.delete(key: key);
    await storage.write(key: key, value: value);
  } 

  @override
  Future<void> delete(String key) {
    return storage.delete(key: key);
  }

}