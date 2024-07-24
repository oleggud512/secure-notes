import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/features/editor/application/providers/curret_note_provider.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:editor_riverpod/src/features/local_auth/application/auth_service_provider.dart';
import 'package:editor_riverpod/src/features/local_auth/application/services/auth_service.dart';

part 'change_password_use_case.g.dart';

class ChangePasswordUseCase {
  final AuthService authService;
  final CurrentNote curNote;

  ChangePasswordUseCase({
    required this.authService,
    required this.curNote
  });

  Future<Either<AppException, void>> call(String oldPassword, String newPassword) async {
    curNote.setCurrentNote(null);
    return await authService.changePassword(oldPassword, newPassword);
  }
}

@riverpod
ChangePasswordUseCase changePasswordUseCase(ChangePasswordUseCaseRef ref) {
  return ChangePasswordUseCase(
    authService: ref.watch(authServiceProvider),
    curNote: ref.watch(currentNoteProvider.notifier)
  );
}

