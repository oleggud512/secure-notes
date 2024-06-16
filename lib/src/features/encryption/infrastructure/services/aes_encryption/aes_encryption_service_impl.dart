import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:encrypt/encrypt.dart';

import '../../../application/services/aes_encryption/aes_encryption_service.dart';

class AESEncryptionServiceImpl implements AESEncryptionService {
  AESEncryptionServiceImpl._();

  static AESEncryptionServiceImpl? _instance;

  static AESEncryptionServiceImpl get instance {
    _instance ??= AESEncryptionServiceImpl._();
    return _instance!;
  }

  // final _keyLen = 32;
  final _ivLen = 16;

  @override
  String decrypt(String combination, String key) {
    final combinationBytes = base64Decode(combination);
    final iv = IV(combinationBytes.sublist(0, _ivLen));
    final encrypted = Encrypted(combinationBytes.sublist(_ivLen));
    final encrypter = Encrypter(AES(Key.fromBase64(key)));
    return encrypter.decrypt(encrypted, iv: iv);
  }

  @override
  String encrypt(String data, String key) {
    final iv = IV.fromSecureRandom(_ivLen);
    final encrypter = Encrypter(AES(Key.fromBase64(key)));
    return base64Encode(iv.bytes + encrypter.encrypt(data, iv: iv).bytes);
  }

  @override
  Future<String> generateKey(String password) async {
    print('generateKey($password)');
    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: 10000, // 20k iterations
      bits: 256, // 256 bits = 32 bytes output
    );
    final key = await pbkdf2.deriveKeyFromPassword(password: password, nonce: [34, 98, 3]);
    return base64Encode(await key.extractBytes());
  }

}

