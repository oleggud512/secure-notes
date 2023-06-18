import 'package:editor_riverpod/src/features/encryption/application/services/rsa_encryption/key_pem_converter.dart';
import 'package:editor_riverpod/src/features/encryption/infrastructure/services/rsa_encryption/key_pem_converter_impl.dart';
import 'package:editor_riverpod/src/features/encryption/infrastructure/services/rsa_encryption/rsa_encryption_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  KeyPemConverter sut = KeyPemConverterImpl.instance;
  final serv = RSAEncryptionServiceImpl.instance;

  test('test pem', () async {
    final keyPair = serv.generateKeyPair();

    final privatePem = sut.encodePrivateKey(keyPair.privateKey);
    final privateUnpem = sut.parsePrivateKey(privatePem);

    final publicPem = sut.encodePublicKey(keyPair.publicKey);
    final publicUnpem = sut.parsePublicKey(publicPem);

    expect(privateUnpem, keyPair.privateKey);
    expect(publicUnpem, keyPair.publicKey);
  });
}