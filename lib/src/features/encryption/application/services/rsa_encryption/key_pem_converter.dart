import 'package:pointycastle/export.dart';

abstract interface class KeyPemConverter {
  String encodePrivateKey(RSAPrivateKey privateKey);
  String encodePublicKey(RSAPublicKey publicKey);
  RSAPrivateKey parsePrivateKey(String privatePem);
  RSAPublicKey parsePublicKey(String publicPem);
}