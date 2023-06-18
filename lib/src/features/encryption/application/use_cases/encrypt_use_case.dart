import 'dart:convert';

import 'package:editor_riverpod/src/core/common/as_bytes.dart';
import 'package:editor_riverpod/src/core/common/constants/keys.dart';
import 'package:editor_riverpod/src/core/external/data_sources/key_value_storage/secure_storage_provider.dart';
import 'package:editor_riverpod/src/core/infrastructure/data_sources/key_value_storage/key_value_storage_data_source.dart';
import 'package:pointycastle/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infrastructure/services/rsa_encryption/key_pem_converter_impl.dart';
import '../../infrastructure/services/rsa_encryption/rsa_encryption_service_impl.dart';
import '../services/rsa_encryption/key_pem_converter.dart';
import '../services/rsa_encryption/rsa_encryption_service.dart';

part 'encrypt_use_case.g.dart';

abstract interface class EncryptUseCase {
  Future<String> call(String data);
}

class EncryptUseCaseImpl implements EncryptUseCase {
  RSAEncryptionService encrServ;
  KeyValueStorageDataSource secureStorage;
  KeyPemConverter converter;

  EncryptUseCaseImpl(this.encrServ, this.converter, this.secureStorage);

  @override
  Future<String> call(String data) async {
    if (data.isEmpty) {
      return data;
    }
    final bytes = data.asBytes;
    final privateKey = await _getPublicKey();
    final encrypted = encrServ.encrypt(bytes, privateKey);
    return base64Encode(encrypted);
  }

  Future<RSAPublicKey> _getPublicKey() async {
    final pem = await secureStorage.read(StorageKeys.publicKey);
    return converter.parsePublicKey(pem!);
  }
}

@riverpod
EncryptUseCase encryptUseCase(EncryptUseCaseRef ref) {
  return EncryptUseCaseImpl(
    RSAEncryptionServiceImpl.instance, 
    KeyPemConverterImpl.instance, 
    ref.watch(secureStorageProvider)
  );
}