import 'dart:typed_data';

import 'package:pointycastle/export.dart';

abstract interface class RSAEncryptionService {
  AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> generateKeyPair();
  Uint8List encrypt(Uint8List plain, RSAPublicKey publicKey);
  Uint8List decrypt(Uint8List encrypted, RSAPrivateKey privateKey);
}