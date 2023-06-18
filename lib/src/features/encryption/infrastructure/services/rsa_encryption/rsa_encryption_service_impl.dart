import 'dart:math';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/export.dart';

import '../../../application/services/rsa_encryption/rsa_encryption_service.dart';

class RSAEncryptionServiceImpl implements RSAEncryptionService {
  RSAEncryptionServiceImpl._();

  static RSAEncryptionServiceImpl? _instance;

  static RSAEncryptionServiceImpl get instance {
    _instance ??= RSAEncryptionServiceImpl._();
    return _instance!;
  }

  static Uint8List _generateAESKey() {
    final random = Random.secure();
    final key = Uint8List(32); // AES-256 key size

    for (var i = 0; i < key.length; i++) {
      key[i] = random.nextInt(256); // Generate a random byte
    }

    return key;
  }

  @override
  AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> generateKeyPair() {
    final secureRandom = FortunaRandom();
    secureRandom.seed(KeyParameter(_generateAESKey()));


    final keyGen = RSAKeyGenerator()
      ..init(ParametersWithRandom(
        RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 64),
        secureRandom,
      ));

    return keyGen.generateKeyPair();
  }

  @override
  Uint8List decrypt(Uint8List encrypted, RSAPrivateKey privateKey) {
    // final decryptor = RSAEngine()
    //   ..init(
    //     false, // decrypting
    //     PrivateKeyParameter<RSAPrivateKey>(privateKey),
    //   );

    // return _processInBlocks(decryptor, encrypted);
    final encrypter = Encrypter(RSA(privateKey: privateKey));
    return Uint8List.fromList(encrypter.decryptBytes(Encrypted(encrypted)));
  }

  @override
  Uint8List encrypt(Uint8List plain, RSAPublicKey publicKey) {
    // final encryptor = RSAEngine()
    //   ..init(
    //     true, // encrypting
    //     PublicKeyParameter<RSAPublicKey>(publicKey),
    //   );

    // return _processInBlocks(encryptor, plain);
    final encrypter = Encrypter(RSA(publicKey: publicKey));
    return encrypter.encryptBytes(plain).bytes;
  }

  static Uint8List _processInBlocks(AsymmetricBlockCipher cipher, Uint8List input) {
    final inputBlockSize = cipher.inputBlockSize;
    final outputBlockSize = cipher.outputBlockSize;

    final inputBuffer = Uint8List(inputBlockSize);
    final outputBuffer = Uint8List(outputBlockSize);

    final output = <int>[];

    for (var offset = 0; offset < input.length; offset += inputBlockSize) {
      final inputOffset = offset;
      final inputLength = inputBlockSize;
      final inputEnd = inputOffset + inputLength > input.length
          ? input.length
          : inputOffset + inputLength;

      // final outputOffset = offset;
      // final outputLength = outputBlockSize;

      inputBuffer.setRange(0, inputEnd - inputOffset, input, inputOffset);
      final processedBytes = cipher.processBlock(
        inputBuffer, 
        0, 
        inputBuffer.length,
        outputBuffer, 
        0
      );

      output.addAll(outputBuffer.sublist(0, processedBytes));
    }

    return Uint8List.fromList(output);
  }
}


