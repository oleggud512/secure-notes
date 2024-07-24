import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:either_dart/either.dart';

abstract interface class NodeRefresher {

  /// Refreshes the whole state - node and children.
  Future<Either<AppException, void>> refresh([Future? awaiter]);
}