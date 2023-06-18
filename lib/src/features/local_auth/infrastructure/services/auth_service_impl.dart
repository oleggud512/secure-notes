import 'package:editor_riverpod/src/core/application/services/hashing_service.dart';
import 'package:editor_riverpod/src/core/common/constants/keys.dart';
import 'package:editor_riverpod/src/core/external/data_sources/key_value_storage/secure_storage_provider.dart';
import 'package:editor_riverpod/src/core/infrastructure/data_sources/key_value_storage/key_value_storage_data_source.dart';
import 'package:editor_riverpod/src/core/infrastructure/services/hashing_service_impl.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/external/data_sources/key_value_storage/runtime_storage_provider.dart';
import '../../../encryption/application/services/aes_encryption/aes_encryption_service.dart';
import '../../../encryption/application/services/rsa_encryption/key_pem_converter.dart';
import '../../../encryption/application/services/rsa_encryption/rsa_encryption_service.dart';
import '../../../encryption/infrastructure/services/aes_encryption/aes_encryption_service_impl.dart';
import '../../../encryption/infrastructure/services/rsa_encryption/key_pem_converter_impl.dart';
import '../../../encryption/infrastructure/services/rsa_encryption/rsa_encryption_service_impl.dart';
import '../../application/errors/exceptions.dart';
import '../../application/services/auth_service.dart';

part 'auth_service_impl.g.dart';

class AuthServiceImpl extends ChangeNotifier implements AuthService {
  final KeyValueStorageDataSource runtimeStorage;
  final KeyValueStorageDataSource secureStorage;
  final RSAEncryptionService encryptionService;
  final HashingService hashingService;
  final AESEncryptionService aesServ;
  final KeyPemConverter pemConverter;
  final logger = Logger();

  AuthServiceImpl({
    required this.runtimeStorage, 
    required this.secureStorage, 
    required this.encryptionService, 
    required this.hashingService, 
    required this.aesServ, 
    required this.pemConverter
  });

  @override
  Future<Either<LocalAuthException, void>> signInLocally(String password) async {
    
    var hashedPassword = await secureStorage.read(StorageKeys.hashedPassword);
    final passwordAesKey = await aesServ.generateKey(password);

    if (hashedPassword == null) {
      final keyPair = encryptionService.generateKeyPair();

      await secureStorage.write(
        StorageKeys.publicKey, 
        pemConverter.encodePublicKey(keyPair.publicKey)
      );
      await secureStorage.write(
        StorageKeys.encryptedPrivateKey, 
        aesServ.encrypt(pemConverter.encodePrivateKey(keyPair.privateKey), passwordAesKey)
      );

      hashedPassword = hashingService.hash(password);
      await secureStorage.write(StorageKeys.hashedPassword, hashedPassword);
    }

    final same = hashingService.compare(password, hashedPassword);
    if (!same) return Left(IncorrectPasswordException());

    try {
      final encryptedPrivateKeyPem = await secureStorage.read(StorageKeys.encryptedPrivateKey);
      final privateKeyPem = aesServ.decrypt(encryptedPrivateKeyPem!, passwordAesKey);

      await runtimeStorage.write(StorageKeys.decryptedPrivateKey, privateKeyPem);

      notifyListeners();
      print('notifyListeners()');
      return const Right(null);
    } catch (e) {
      logger.e(e);
      return Left(IncorrectPasswordException());
    }
  }
  
  @override
  Future<bool> get isSignedInLocally async {
    final res = await runtimeStorage.read(StorageKeys.decryptedPrivateKey);
    return res != null;
  }
  
  @override
  Future<void> localSignOut() async {
    await runtimeStorage.delete(StorageKeys.decryptedPrivateKey);
    notifyListeners();
  }
  
  @override
  Future<Either<LocalAuthException, void>> changePassword(
    String oldPassword, 
    String newPassword
  ) async {
    final oldHash = await secureStorage.read(StorageKeys.hashedPassword);
    final isSame = hashingService.compare(oldPassword, oldHash!);

    if (!isSame) return Left(IncorrectPasswordException());

    final newHash = hashingService.hash(newPassword);

    await secureStorage.write(StorageKeys.hashedPassword, newHash);

    final newPasswordKey = await aesServ.generateKey(newPassword);
    final privateKeyPem = await runtimeStorage.read(StorageKeys.decryptedPrivateKey);
    final encryptedPrivateKey = aesServ.encrypt(privateKeyPem!, newPasswordKey);

    await secureStorage.write(StorageKeys.encryptedPrivateKey, encryptedPrivateKey);

    return const Right(null);
  }

  
}

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthServiceImpl(
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
  return ref.watch(authServiceProvider) as AuthServiceImpl;
}