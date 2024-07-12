import 'package:editor_riverpod/src/core/common/constants/keys.dart';
import 'package:editor_riverpod/src/core/external/data_sources/key_value_storage/secure_storage_provider.dart';
import 'package:editor_riverpod/src/core/infrastructure/data_sources/key_value_storage/key_value_storage_data_source.dart';
import 'package:editor_riverpod/src/features/encryption/application/services/aes_encryption/aes_encryption_service.dart';
import 'package:editor_riverpod/src/features/encryption/infrastructure/services/aes_encryption/aes_encryption_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infrastructure/services/rsa_encryption/key_pem_converter_impl.dart';
import '../services/rsa_encryption/key_pem_converter.dart';

part 'encrypt_use_case.g.dart';

abstract interface class EncryptUseCase {
  Future<String> call(String data);
}

class EncryptUseCaseImpl implements EncryptUseCase {
  // RSAEncryptionService encrServ;
  AESEncryptionService encrServ;
  KeyValueStorageDataSource secureStorage;
  KeyPemConverter converter;

  EncryptUseCaseImpl(this.encrServ, this.converter, this.secureStorage);

  @override
  Future<String> call(String data) async {
    if (data.isEmpty) {
      return data;
    }
    // return encryptRsa(data);
    return _encryptAes(data);
  }

  // Future<String> encryptRsa(String data) async {
  //   final bytes = data.asBytes;
  //   final privateKey = await _getPublicKey();
  //   final encrypted = encrServ.encrypt(bytes, privateKey);
  //   return base64Encode(encrypted);
  // }

  // Future<RSAPublicKey> _getPublicKey() async {
  //   final pem = await secureStorage.read(StorageKeys.publicKey);
  //   return converter.parsePublicKey(pem!);
  // }

  Future<String> _encryptAes(String data) async {
    final key = await _getCurrentAesKey();
    return encrServ.encrypt(data, key);
  }

  Future<String> _getCurrentAesKey() async {
    final res = await secureStorage.read(StorageKeys.aesKey);
    return res!;
  }
}

@riverpod
EncryptUseCase encryptUseCase(EncryptUseCaseRef ref) {
  return EncryptUseCaseImpl(
    // RSAEncryptionServiceImpl.instance, 
    AESEncryptionServiceImpl.instance,
    KeyPemConverterImpl.instance, 
    ref.watch(secureStorageProvider)
  );
}