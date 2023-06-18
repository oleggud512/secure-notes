import 'package:editor_riverpod/src/core/external/data_sources/key_value_storage/runtime_storage_impl.dart';
import 'package:editor_riverpod/src/core/external/data_sources/key_value_storage/secure_storage_impl.dart';
import 'package:editor_riverpod/src/core/infrastructure/data_sources/key_value_storage/key_value_storage_data_source.dart';
import 'package:editor_riverpod/src/features/encryption/application/services/rsa_encryption/key_pem_converter.dart';
import 'package:editor_riverpod/src/features/encryption/infrastructure/services/rsa_encryption/key_pem_converter_impl.dart';
import 'package:editor_riverpod/src/features/encryption/infrastructure/services/rsa_encryption/rsa_encryption_service_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    FlutterSecureStorage.setMockInitialValues({});
  });

  final encr = RSAEncryptionServiceImpl.instance;
  final conv = KeyPemConverterImpl.instance;
  KeyValueStorageDataSource secureStorage = SecureStorageImpl();
  KeyValueStorageDataSource sut = RuntimeStorage(secureStorage);

  group('runtime storage tests >', () {

    test('store and get data', () async {
      await sut.write('key', 'value');
      final value = await sut.read('key');
      expect(value, 'value');
    });

    test('store and delete', () async {
      const key = 'key';
      await sut.write(key, 'value');
      await sut.delete(key);
      final value = await sut.read(key);
      expect(value, isNull);
    });

    // test('compare secure and runtime', () async {
    //   final keys = encr.generateKeyPair();

    //   secureStorage.write('private', conv.encodePrivateKey(keys.privateKey));
    // });

  });
}