import '../../../core/application/errors/exceptions.dart';

class EncryptionException extends AppException { 
  EncryptionException([super.message, super.stackTrace]);
}

class DecryptionException extends AppException { 
  DecryptionException([super.message, super.stackTrace]);
}