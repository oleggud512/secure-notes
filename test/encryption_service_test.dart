import 'dart:typed_data';

import 'package:editor_riverpod/src/features/encryption/application/services/aes_encryption/aes_encryption_service.dart';
import 'package:editor_riverpod/src/features/encryption/application/services/rsa_encryption/key_pem_converter.dart';
import 'package:editor_riverpod/src/features/encryption/application/services/rsa_encryption/rsa_encryption_service.dart';
import 'package:editor_riverpod/src/features/encryption/infrastructure/services/aes_encryption/aes_encryption_service_impl.dart';
import 'package:editor_riverpod/src/features/encryption/infrastructure/services/rsa_encryption/key_pem_converter_impl.dart';
import 'package:editor_riverpod/src/features/encryption/infrastructure/services/rsa_encryption/rsa_encryption_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  AESEncryptionService aesServ = AESEncryptionServiceImpl.instance;
  RSAEncryptionService rsaServ = RSAEncryptionServiceImpl.instance;
  KeyPemConverter keyPemConverter = KeyPemConverterImpl.instance;

  test('test encryption', () {
    // Generate a new RSA key pair
    final keyPair = rsaServ.generateKeyPair();

    final privatePem = keyPemConverter.encodePrivateKey(keyPair.privateKey);
    print(privatePem);
    final privateUnpem = keyPemConverter.parsePrivateKey(privatePem);
    print(privateUnpem);
    final publicPem = keyPemConverter.encodePublicKey(keyPair.publicKey);
    print(publicPem);
    final publicUnpem = keyPemConverter.parsePublicKey(publicPem);
    print(publicUnpem);


    // Generate some sample message to encrypt
    const originalMessage = 'Hello, World!';
    final plain = Uint8List.fromList(originalMessage.codeUnits);

    // Encrypt the message using the public key
    final encrypted = rsaServ.encrypt(plain, publicUnpem);

    // Decrypt the ciphertext using the private key
    final decryptedPlaintext = rsaServ.decrypt(encrypted, privateUnpem);

    // Convert the decrypted plaintext back to a string
    final decryptedMessage = String.fromCharCodes(decryptedPlaintext);

    print('Original Message: $originalMessage');
    print('Decrypted Message: $decryptedMessage');
    expect(decryptedMessage, originalMessage);
  });

  test('aes key generation', () async {
    const password = "some long ljdflskdjflkjwkejfkljkdljflkwjeklfljwdklfjlkwjeofisword";

    final key1 = await aesServ.generateKey(password);
    final key = await aesServ.generateKey(password);
    
    expect(key, key1);
  });

  test('aes encryption', () async {
    const password = "some long ljdflskdjflkjwkejfkljkdljflkwjeklfljwdklfjlkwjeofisword";
    const data = "some data";
    
    final key = await aesServ.generateKey(password);

    final encrypted = aesServ.encrypt(data, key);
    final decrypted = aesServ.decrypt(encrypted, key);

    expect(decrypted, data);
  });
}