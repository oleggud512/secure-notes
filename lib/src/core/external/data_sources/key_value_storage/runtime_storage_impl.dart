import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

import '../../../infrastructure/data_sources/key_value_storage/key_value_storage_data_source.dart';

class RuntimeStorage implements KeyValueStorageDataSource {
  static KeyValueStorageDataSource? inMemoryStorage;

  RuntimeStorage(KeyValueStorageDataSource storage) {
    inMemoryStorage = storage;
  }

  static final Map<String, Uint8List> _encryptedData = {};

  final _ivLen = 16;
  final _keyLen = 32;

  @override
  /// - fetch key from in memory storage
  /// - get encrypted data from runtime
  /// - decrypt data
  /// - return decrypted data
  Future<String?> read(String key) async {
    if (inMemoryStorage == null) throw 'no inMemoryStorage';

    final combinedData = _encryptedData[key];
    if (combinedData == null) return null;

    final base64key = await inMemoryStorage!.read(_withPrefix(key));
    if (base64key == null) return null;
    final encryptionKey = Key.fromBase64(base64key);

    final ivBytes = combinedData.sublist(0, 16);
    final encryptedBytes = combinedData.sublist(16);

    final iv = IV(ivBytes);
    final encryptedData = Encrypted(encryptedBytes);

    final encrypter = Encrypter(AES(encryptionKey));

    final decryptedData = encrypter.decrypt(encryptedData, iv: iv);
    return decryptedData;
  }

  @override
  /// - generate encryption key
  /// - encrypt value
  /// - save key in memory
  /// - save encrypted data in runtime
  Future<void> write(String key, String value) async {
    if (inMemoryStorage == null) throw 'no inMemoryStorage';

    final encryptionKey = Key.fromSecureRandom(_keyLen);

    await inMemoryStorage!.write(_withPrefix(key), encryptionKey.base64);

    final iv = IV.fromSecureRandom(_ivLen);
    final encrypter = Encrypter(AES(encryptionKey));
    final encrypted = encrypter.encrypt(value, iv: iv);

    _encryptedData[key] = Uint8List.fromList(iv.bytes + encrypted.bytes);
  }


  @override
  Future<void> delete(String key) async {
    _encryptedData.remove(_withPrefix(key));
    return inMemoryStorage?.delete(_withPrefix(key));
  }

  _withPrefix(String key) => "runtimeStorage-$key";
}
