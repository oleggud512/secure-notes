
import 'package:editor_riverpod/src/features/local_auth/application/services/auth_service.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../features/local_auth/infrastructure/services/auth_service_impl.dart';
import '../errors/exceptions.dart';

part 'local_sing_in_use_case.g.dart';

/// If the password is correct, decrypts private key and saves it to runtime 
/// storage, so the [LocalAuthGuard] will allow as to enter [MainPage]
/// If there is no password to check - first sign in
/// - generates public/private keys pair. 
/// - ...
class LocalSignInUseCase {
  AuthService authService;

  LocalSignInUseCase(this.authService);

  Future<Either<LocalAuthException, void>> call(String password) async {
    final res = authService.signInLocally(password);
    return res;
  }
}

@riverpod
LocalSignInUseCase localSignInUseCase(LocalSignInUseCaseRef ref) {
  return LocalSignInUseCase(ref.watch(authServiceProvider));
}