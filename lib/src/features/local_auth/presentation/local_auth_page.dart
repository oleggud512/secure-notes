import 'package:auto_route/auto_route.dart';
import 'package:editor_riverpod/src/core/common/debounce.dart';
import 'package:editor_riverpod/src/core/common/hardcoded.dart';
import 'package:editor_riverpod/src/core/presentation/constants.dart';
import 'package:editor_riverpod/src/core/presentation/password_text_field.dart';
import 'package:editor_riverpod/src/features/local_auth/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/features/local_auth/domain/local_auth_page_state.dart';
import 'package:editor_riverpod/src/features/local_auth/infrastructure/controllers/local_auth_page_controller_impl.dart';
import 'package:editor_riverpod/src/features/local_auth/presentation/local_auth_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LocalAuthPage extends ConsumerStatefulWidget {
  const LocalAuthPage({super.key, required this.onResult});

  final void Function(bool result) onResult;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocalAuthPageState();
}
class _LocalAuthPageState extends ConsumerState<LocalAuthPage> {
  LocalAuthPageController get cont => ref.watch(localAuthPageControllerImplProvider.notifier);
  LocalAuthPageState get state => ref.watch(localAuthPageControllerImplProvider);

  onChangePassword(String password) {
    cont.setPassword(password);
  }

  onSignIn() async {
    final res = await cont.signIn();
    if (res.isRight) {
      widget.onResult(true);
      return;
    }
    res.mapLeft((left) {
      if (left is IncorrectPasswordException) {
        isCorrectPassword = false;
        formKey.currentState!.validate();
      }
    });
  }

  final formKey = GlobalKey<FormState>();
  bool isCorrectPassword = true;

  String? validatePassword(String? password) {
    if (!isCorrectPassword) return 'INCORRECT PASSWORD'.hardcoded;
    return null;
  }

  bool isPasswordShown = false;
  final passwordShownDebouncer = Debouncer();
  changePasswordShown(bool v) => setState(() => isPasswordShown = v);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: p400,
          ),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: p16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PasswordTextField(
                    validator: validatePassword,
                    onChanged: onChangePassword,
                    onFieldSubmitted: (v) => onSignIn()
                  ),
                  h16gap,
                  FilledButton.icon(
                    label: Text('Enter'.hardcoded),
                    icon: const Icon(Icons.login),
                    onPressed: onSignIn
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}