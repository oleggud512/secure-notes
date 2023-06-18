import 'package:basic_utils/basic_utils.dart';
import 'package:editor_riverpod/src/features/encryption/application/services/rsa_encryption/key_pem_converter.dart';
import 'package:encrypt/encrypt.dart';
import 'package:pem/pem.dart';
import 'package:pointycastle/asymmetric/api.dart';


class KeyPemConverterImpl implements KeyPemConverter {
  KeyPemConverterImpl._();

  static KeyPemConverterImpl? _instance;

  static KeyPemConverterImpl get instance {
    _instance ??= KeyPemConverterImpl._();
    return _instance!;
  }
  
  @override
  String encodePrivateKey(RSAPrivateKey privateKey) {
    return CryptoUtils.encodeRSAPrivateKeyToPem(privateKey);
  }

  @override
  String encodePublicKey(RSAPublicKey publicKey) {
    return CryptoUtils.encodeRSAPublicKeyToPem(publicKey);
  }

  @override
  RSAPrivateKey parsePrivateKey(String privatePem) {
    return CryptoUtils.rsaPrivateKeyFromPem(privatePem);
  }

  @override
  RSAPublicKey parsePublicKey(String publicPem) {
    return CryptoUtils.rsaPublicKeyFromPem(publicPem);
  }

}