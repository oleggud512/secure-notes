import 'package:editor_riverpod/src/features/local_auth/application/services/auth_service.dart';
import 'package:editor_riverpod/src/features/local_auth/infrastructure/services/auth_service_provider.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/application/errors/exceptions.dart';

part 'change_password_use_case.g.dart';

class ChangePasswordUseCase {
  final AuthService authServ;

  ChangePasswordUseCase(this.authServ);

  Future<Either<AppException, void>> call(String oldPassword, String newPassword) async {
    final res = await authServ.changePassword(oldPassword, newPassword);
    return res;
  }
}

@riverpod
ChangePasswordUseCase changePasswordUseCase(ChangePasswordUseCaseRef ref) {
  return ChangePasswordUseCase(ref.watch(authServiceProvider));
}