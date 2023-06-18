import 'package:either_dart/either.dart';

import '../application/errors/exceptions.dart';

abstract interface class LocalAuthPageController {
  void setPassword(String password);

  Future<Either<LocalAuthException, void>> signIn();
}