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


/// TODO: remove this
class RSAAuthServiceImpl extends ChangeNotifier implements AuthService {
  final KeyValueStorageDataSource runtimeStorage;
  final KeyValueStorageDataSource secureStorage;
  final RSAEncryptionService encryptionService;
  final HashingService hashingService;
  final AESEncryptionService aesServ;
  final KeyPemConverter pemConverter;
  final logger = Logger();

  RSAAuthServiceImpl({
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
      initRSA(passwordAesKey);

      // storing hashed password in a secured storage
      hashedPassword = hashingService.hash(password);
      await secureStorage.write(StorageKeys.hashedPassword, hashedPassword);
    }

    // here, the password is definitely exists.
    // compare stored password with an entered one
    final same = hashingService.compare(password, hashedPassword);
    if (!same) return Left(IncorrectPasswordException());

    try {
      signInRSA(passwordAesKey);
      notifyListeners();
      print('notifyListeners()');
      return const Right(null);
    } catch (e) {
      logger.e(e);
      return Left(IncorrectPasswordException());
    }
  }

  Future<void> initRSA(String passwordAesKey) async {
    final keyPair = encryptionService.generateKeyPair();

    await secureStorage.write(
      StorageKeys.publicKey, 
      pemConverter.encodePublicKey(keyPair.publicKey)
    );
    
    final encryptedPrivateKeyPem = aesServ.encrypt(
      pemConverter.encodePrivateKey(keyPair.privateKey), 
      passwordAesKey
    );
    await secureStorage.write(
      StorageKeys.encryptedPrivateKey, 
      encryptedPrivateKeyPem
    );
  }

  Future<void> signInRSA(String passwordAesKey) async {
    final encryptedPrivateKeyPem = await secureStorage.read(StorageKeys.encryptedPrivateKey);
    final privateKeyPem = aesServ.decrypt(encryptedPrivateKeyPem!, passwordAesKey);

    await runtimeStorage.write(StorageKeys.decryptedPrivateKey, privateKeyPem);
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
  
  @override
  Stream<Either<LocalAuthException, void>> watchPasswordChange() {
    // TODO: implement watchPasswordChange
    throw UnimplementedError();
  }
}