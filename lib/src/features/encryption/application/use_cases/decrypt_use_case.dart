import 'dart:convert';

import 'package:pointycastle/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/common/constants/keys.dart';
import '../../../../core/external/data_sources/key_value_storage/runtime_storage_provider.dart';
import '../../../../core/infrastructure/data_sources/key_value_storage/key_value_storage_data_source.dart';
import '../../infrastructure/services/rsa_encryption/key_pem_converter_impl.dart';
import '../../infrastructure/services/rsa_encryption/rsa_encryption_service_impl.dart';
import '../services/rsa_encryption/key_pem_converter.dart';
import '../services/rsa_encryption/rsa_encryption_service.dart';

part 'decrypt_use_case.g.dart';

abstract interface class DecryptUseCase {
  Future<String> call(String data);
}

class DecryptUseCaseImpl implements DecryptUseCase {
  RSAEncryptionService encrServ;
  KeyValueStorageDataSource runtimeStorage;
  KeyPemConverter converter;

  DecryptUseCaseImpl(this.encrServ, this.converter, this.runtimeStorage);

  @override
  Future<String> call(String data) async {
    if (data.isEmpty) {
      return data;
    }
    final bytes = base64Decode(data);
    final privateKey = await _getPrivateKey();
    final encrypted = encrServ.decrypt(bytes, privateKey);
    return utf8.decode(encrypted);
  }

  Future<RSAPrivateKey> _getPrivateKey() async {
    final pem = await runtimeStorage.read(StorageKeys.decryptedPrivateKey);
    return converter.parsePrivateKey(pem!);
  }
}

@riverpod
DecryptUseCase decryptUseCase(DecryptUseCaseRef ref) {
  return DecryptUseCaseImpl(
    RSAEncryptionServiceImpl.instance, 
    KeyPemConverterImpl.instance, 
    ref.watch(runtimeStorageProvider)
  );
}