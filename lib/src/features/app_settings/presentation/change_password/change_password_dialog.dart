import 'package:auto_route/auto_route.dart';
import 'package:editor_riverpod/src/core/common/hardcoded.dart';
import 'package:editor_riverpod/src/core/presentation/password_text_field.dart';
import 'package:editor_riverpod/src/features/app_settings/presentation/change_password/change_password_dialog_controller.dart';
import 'package:editor_riverpod/src/features/app_settings/presentation/change_password/change_password_dialog_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/constants.dart';

class ChangePasswordDialog extends ConsumerStatefulWidget {
  const ChangePasswordDialog({super.key});

  static show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return ChangePasswordDialog();
      }
    );
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangePasswordDialogState();
}
class _ChangePasswordDialogState extends ConsumerState<ChangePasswordDialog> {
  ChangePasswordDialogController get cont => ref.watch(changePasswordDialogControllerProvider.notifier);
  ChangePasswordDialogState get state => ref.watch(changePasswordDialogControllerProvider);

  final formKey = GlobalKey<FormState>();

  bool isPasswordCorrect = false;

  void onChangeOld(String oldPassword) async {
    cont.setOldPassword(oldPassword);
  }

  void onChangeNew(String newPassword) {
    cont.setNewPassword(newPassword);
  }

  void onSubmit() async {
    final res = await cont.changePassword();
    res.fold((l) {
      isPasswordCorrect = false;
    }, (r) {
      isPasswordCorrect = true;
      context.popRoute();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password changed successfully'),
        behavior: SnackBarBehavior.floating,
      ));
    });
    formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: p400
        ),
        child: Padding(
          padding: const EdgeInsets.all(p24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                PasswordTextField(
                  helperText: 'Old password'.hardcoded,
                  validator: (s) {
                    if (!isPasswordCorrect) return 'INCORRECT PASSWORD';
                    return null;
                  },
                  onChanged: onChangeOld
                ),
                h8gap,
                PasswordTextField(
                  helperText: 'New password'.hardcoded,
                  onChanged: onChangeNew
                ),
                h8gap,
                FilledButton(
                  onPressed: onSubmit, 
                  child: Text('Change password'.hardcoded)
                )
              ]
            ),
          )
        ),
      ),
    );
  }
}