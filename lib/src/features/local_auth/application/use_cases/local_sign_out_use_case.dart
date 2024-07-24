
import 'package:editor_riverpod/src/features/editor/application/providers/curret_note_provider.dart';
import 'package:editor_riverpod/src/features/local_auth/application/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:editor_riverpod/src/features/local_auth/application/auth_service_provider.dart';

part 'local_sign_out_use_case.g.dart';

/// If the password is correct, decrypts private key and saves it to runtime 
/// storage, so the [LocalAuthGuard] will allow as to enter [MainPage]
/// If there is no password to check - first sign in
/// - generates public/private keys pair. 
/// - ...
class LocalSignOutUseCase {
  AuthService authService;
  CurrentNote curNote;

  LocalSignOutUseCase({
    required this.authService, 
    required this.curNote
  });

  Future<void> call() async {
    curNote.setCurrentNote(null);
    await authService.localSignOut();
  }
}

@riverpod
LocalSignOutUseCase localSignOutUseCase(LocalSignOutUseCaseRef ref) {
  return LocalSignOutUseCase(
    authService: ref.watch(authServiceProvider), 
    curNote: ref.watch(currentNoteProvider.notifier)
  );
}