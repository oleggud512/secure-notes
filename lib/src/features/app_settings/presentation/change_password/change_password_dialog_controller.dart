import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/features/local_auth/application/use_cases/change_password_use_case.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'change_password_dialog_state.dart';

part 'change_password_dialog_controller.g.dart';

@riverpod
class ChangePasswordDialogController extends _$ChangePasswordDialogController {

  ChangePasswordUseCase get _changePasswordUseCase => 
    ref.watch(changePasswordUseCaseProvider);

  @override
  ChangePasswordDialogState build() {
    return ChangePasswordDialogState();
  }

  void setOldPassword(String oldPassword) {
    state = state.copyWith(oldPassword: oldPassword);
  }

  void setNewPassword(String newPassword) {
    state = state.copyWith(newPassword: newPassword);
  }

  Future<Either<AppException, void>> changePassword() async {
    final res = await _changePasswordUseCase.call(state.oldPassword, state.newPassword);
    return res;
  }
}