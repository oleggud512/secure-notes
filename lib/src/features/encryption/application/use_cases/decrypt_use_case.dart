import 'package:editor_riverpod/src/features/editor/application/exceptions.dart';
import 'package:editor_riverpod/src/features/encryption/application/services/aes_encryption/aes_encryption_service.dart';
import 'package:editor_riverpod/src/features/encryption/infrastructure/services/aes_encryption/aes_encryption_service_impl.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/common/constants/keys.dart';
import '../../../../core/external/data_sources/key_value_storage/runtime_storage_provider.dart';
import '../../../../core/infrastructure/data_sources/key_value_storage/key_value_storage_data_source.dart';
import '../../infrastructure/services/rsa_encryption/key_pem_converter_impl.dart';
import '../services/rsa_encryption/key_pem_converter.dart';

part 'decrypt_use_case.g.dart';

abstract interface class DecryptUseCase {
  Future<Either<DecryptionException, String>> call(String data);
}

class DecryptUseCaseImpl implements DecryptUseCase {
  // RSAEncryptionService encrServ;
  AESEncryptionService encrServ;
  KeyValueStorageDataSource runtimeStorage;
  KeyPemConverter converter;

  DecryptUseCaseImpl(this.encrServ, this.converter, this.runtimeStorage);

  @override
  Future<Either<DecryptionException, String>> call(String data) async {
    if (data.isEmpty) {
      return Right(data);
    }
    
    // return decryptRsa(data);
    return _decryptAes(data);
  }

  // Future<String> decryptRsa(String data) async {
  //   final bytes = base64Decode(data);
  //   final privateKey = await _getPrivateKey();
  //   final encrypted = encrServ.decrypt(bytes, privateKey);
  //   return utf8.decode(encrypted);
  // }

  // Future<RSAPrivateKey> _getPrivateKey() async {
  //   final pem = await runtimeStorage.read(StorageKeys.decryptedPrivateKey);
  //   return converter.parsePrivateKey(pem!);
  // }

  Future<Either<DecryptionException, String>> _decryptAes(String data) async {
    final key = await _getCurrentAesKey();
    try {
      final res = encrServ.decrypt(data, key);
      return Right(res);
    } on DecryptionException catch (e) {
      return Left(e);
    }
  }


  Future<String> _getCurrentAesKey() async {
    final res = await runtimeStorage.read(StorageKeys.aesKey);
    return res!;
  }
}

@riverpod
DecryptUseCase decryptUseCase(DecryptUseCaseRef ref) {
  return DecryptUseCaseImpl(
    // RSAEncryptionServiceImpl.instance, 
    AESEncryptionServiceImpl.instance, 
    KeyPemConverterImpl.instance, 
    ref.watch(runtimeStorageProvider)
  );
}