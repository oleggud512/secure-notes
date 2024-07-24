import 'package:either_dart/either.dart';

import '../errors/exceptions.dart';

abstract interface class AuthService {
  Future<Either<LocalAuthException, void>> localSignIn(String password);
  Future<Either<LocalAuthException, void>> changePassword(String oldPassword, String newPassword);

  Stream<void> watchPasswordChange();

  Future<void> localSignOut();

  Future<bool> get isSignedInLocally;
}