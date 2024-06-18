import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:editor_riverpod/src/features/local_auth/application/auth_service_provider.dart';
import 'package:editor_riverpod/src/features/local_auth/application/services/auth_service.dart';

part 'change_password_use_case.g.dart';

class ChangePasswordUseCase {
  final AuthService authService;

  ChangePasswordUseCase(this.authService);

  Future<void> call(String oldPassword, String newPassword) async {
    await authService.changePassword(oldPassword, newPassword);
  }
}

@riverpod
ChangePasswordUseCase changePasswordUseCase(ChangePasswordUseCaseRef ref) {
  return ChangePasswordUseCase(
    ref.watch(authServiceProvider)
  );
}

