import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_dialog_state.freezed.dart';

@freezed
class ChangePasswordDialogState with _$ChangePasswordDialogState {
  factory ChangePasswordDialogState({
    @Default("") String oldPassword,
    @Default("") String newPassword
  }) = _ChangePasswordState;
}