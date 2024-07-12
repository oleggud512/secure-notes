import 'package:editor_riverpod/src/core/external/data_sources/key_value_storage/secure_storage_provider.dart';
import 'package:editor_riverpod/src/core/infrastructure/services/hashing_service_impl.dart';
import 'package:editor_riverpod/src/features/local_auth/infrastructure/services/aes_auth_service_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/external/data_sources/key_value_storage/runtime_storage_provider.dart';
import '../../encryption/infrastructure/services/aes_encryption/aes_encryption_service_impl.dart';
import '../../encryption/infrastructure/services/rsa_encryption/key_pem_converter_impl.dart';
import '../../encryption/infrastructure/services/rsa_encryption/rsa_encryption_service_impl.dart';
import 'services/auth_service.dart';

part 'auth_service_provider.g.dart';


@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  // return RSAAuthServiceImpl(
  //   runtimeStorage: ref.watch(runtimeStorageProvider),
  //   secureStorage: ref.watch(secureStorageProvider),
  //   encryptionService: RSAEncryptionServiceImpl.instance,
  //   hashingService: HashingServiceImpl.instance,
  //   aesServ: AESEncryptionServiceImpl.instance,
  //   pemConverter: KeyPemConverterImpl.instance,
  // );
  return AESAuthServiceImpl(
    runtimeStorage: ref.watch(runtimeStorageProvider),
    secureStorage: ref.watch(secureStorageProvider),
    encryptionService: RSAEncryptionServiceImpl.instance,
    hashingService: HashingServiceImpl.instance,
    aesServ: AESEncryptionServiceImpl.instance,
    pemConverter: KeyPemConverterImpl.instance,
  );
}

@riverpod
Listenable reevaluateLisenable(ReevaluateLisenableRef ref) {
  // return ref.watch(authServiceProvider) as RSAAuthServiceImpl;
  return ref.watch(authServiceProvider) as AESAuthServiceImpl;
}