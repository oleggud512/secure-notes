import 'package:editor_riverpod/src/features/local_auth/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/features/local_auth/application/use_cases/local_sing_in_use_case.dart';
import 'package:editor_riverpod/src/features/local_auth/presentation/local_auth_page_controller.dart';
import 'package:either_dart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/local_auth_page_state.dart';

part 'local_auth_page_controller_impl.g.dart';

@riverpod
class LocalAuthPageControllerImpl extends _$LocalAuthPageControllerImpl
    implements LocalAuthPageController {
  @override
  LocalAuthPageState build() {
    return LocalAuthPageState();
  }

  @override
  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  @override
  Future<Either<LocalAuthException, void>> signIn() async {
    final res = await ref.watch(localSignInUseCaseProvider)(state.password);
    return res;
  }
}