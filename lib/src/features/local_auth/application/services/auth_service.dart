import 'package:either_dart/either.dart';

import '../errors/exceptions.dart';

abstract interface class AuthService {
  Future<Either<LocalAuthException, void>> signInLocally(String password);
  Future<Either<LocalAuthException, void>> changePassword(String oldPassword, String newPassword);
  Future<void> localSignOut();

  Future<bool> get isSignedInLocally;
}