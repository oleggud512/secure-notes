import 'package:editor_riverpod/src/features/encryption/application/use_cases/decrypt_use_case.dart';
import 'package:editor_riverpod/src/features/encryption/application/use_cases/encrypt_use_case.dart';
import 'package:editor_riverpod/src/features/local_auth/application/use_cases/local_sing_in_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  EncryptUseCase encryptUseCase = container.read(encryptUseCaseProvider);
  DecryptUseCase decryptUseCase = container.read(decryptUseCaseProvider);

  setUpAll(() async {
    FlutterSecureStorage.setMockInitialValues({});

    await container.read(localSignInUseCaseProvider).call('asdfasdf');
  });

  test('test encryption use cases', () async {
    const str = 'some long string';

    final encrypted = await encryptUseCase(str);
    final decrypted = await decryptUseCase(encrypted);

    expect(decrypted, str);
  });

} 