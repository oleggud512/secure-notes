import 'package:editor_riverpod/src/core/application/services/hashing_service.dart';
import 'package:editor_riverpod/src/core/common/constants/keys.dart';
import 'package:editor_riverpod/src/core/infrastructure/data_sources/key_value_storage/key_value_storage_data_source.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../../encryption/application/services/aes_encryption/aes_encryption_service.dart';
import '../../../encryption/application/services/rsa_encryption/key_pem_converter.dart';
import '../../../encryption/application/services/rsa_encryption/rsa_encryption_service.dart';
import '../../application/errors/exceptions.dart';
import '../../application/services/auth_service.dart';

class AESAuthServiceImpl extends ChangeNotifier implements AuthService {
  final KeyValueStorageDataSource runtimeStorage;
  final KeyValueStorageDataSource secureStorage;
  final RSAEncryptionService encryptionService;
  final HashingService hashingService;
  final AESEncryptionService aesServ;
  final KeyPemConverter pemConverter;
  final logger = Logger();

  AESAuthServiceImpl({
    required this.runtimeStorage, 
    required this.secureStorage, 
    required this.encryptionService, 
    required this.hashingService, 
    required this.aesServ, 
    required this.pemConverter
  });

  @override
  Future<Either<LocalAuthException, void>> signInLocally(String password) async {
    // read the hashed password from the storage
    var hashedPassword = await secureStorage.read(StorageKeys.hashedPassword);
    // generate an AES key for the passphrase
    final passwordAesKey = await aesServ.generateKey(password);

    // no password stored (first run)
    if (hashedPassword == null) {
      await secureStorage.write(StorageKeys.aesKey, passwordAesKey);
      // storing hashed password to secured storage
      hashedPassword = hashingService.hash(password);
      await secureStorage.write(StorageKeys.hashedPassword, hashedPassword);
    }

    // here, the password is definitely exists.
    // compare stored password with an entered one
    final same = hashingService.compare(password, hashedPassword);
    if (!same) return Left(IncorrectPasswordException());

    try {
      await runtimeStorage.write(StorageKeys.aesKey, passwordAesKey);

      notifyListeners();
      return const Right(null);
    } catch (e) {
      logger.e(e);
      return Left(IncorrectPasswordException());
    }
  }

  @override
  Future<bool> get isSignedInLocally async {
    final res = await runtimeStorage.read(StorageKeys.aesKey);
    return res != null;
  }
  
  @override
  Future<void> localSignOut() async {
    await runtimeStorage.delete(StorageKeys.aesKey);
    notifyListeners();
  }
  
  @override
  Future<Either<LocalAuthException, void>> changePassword(
    String oldPassword, 
    String newPassword
  ) async {
    final oldHash = await secureStorage.read(StorageKeys.hashedPassword);
    final isSame = hashingService.compare(oldPassword, oldHash!);

    // check if existing password is a correct one
    if (!isSame) return Left(IncorrectPasswordException());

    // hash new password
    final newHash = hashingService.hash(newPassword);

    // store new hash
    await secureStorage.write(StorageKeys.hashedPassword, newHash);

    // derive new aes key
    final newAesKey = await aesServ.generateKey(newPassword);

    // save new aes key
    await secureStorage.write(StorageKeys.aesKey, newAesKey);

    return const Right(null);
  }
}
