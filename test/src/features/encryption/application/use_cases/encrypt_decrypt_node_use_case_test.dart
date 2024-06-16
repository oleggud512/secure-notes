import 'package:editor_riverpod/src/features/editor/application/use_cases/encryption/decrypt_node_use_case.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/encryption/encrypt_node_use_case.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node_state.dart';
import 'package:editor_riverpod/src/features/local_auth/infrastructure/services/auth_service_provider.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();


  setUpAll(() async {
    FlutterSecureStorage.setMockInitialValues({});
    await container.read(authServiceProvider).signInLocally('password');
  });

  // setUp(() async {
  //   FlutterSecureStorage.setMockInitialValues({});
  // });

  test('encrypt node / decrypt node', () async {
    final note = Note(
      id: 'id',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      state: NodeState.deleted,
      title: "some title",
      content: "some content",
    );

    final folder = Folder(
      id: 'id',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      state: NodeState.unchanged,
      title: 'some t',
    );

    final encryptNodeUseCase = container.read(encryptNodeUseCaseProvider);
    final decryptNodeUseCase = container.read(decryptNodeUseCaseProvider);
    
    final encryptedNote = await encryptNodeUseCase.call(note);
    expect(encryptedNote.isRight, isTrue);
    final decryptedNote = await decryptNodeUseCase.call(encryptedNote.right);
    expect(decryptedNote.isRight, isTrue);
    decryptedNote.map((right) {
      expect(right, note);
    });

    final encryptedFolder = await encryptNodeUseCase(folder);
    expect(encryptedFolder.isRight, isTrue);
    final decryptedFolder = await decryptNodeUseCase(encryptedFolder.right);
    expect(decryptedFolder.isRight, isTrue);
    decryptedFolder.map((right) {
      expect(right, folder);
    });

  });


}