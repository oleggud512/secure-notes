import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';

class LocalAuthException extends AppException {}

class IncorrectPasswordException extends LocalAuthException { }


