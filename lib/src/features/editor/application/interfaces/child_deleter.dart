import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:either_dart/either.dart';

abstract interface class ChildDeleter {
  Future<Either<AppException, void>> deleteChild(String id);
}