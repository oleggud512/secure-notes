import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:either_dart/either.dart';

abstract interface class EditorWidgetController {
  Future<Either<AppException, String>> updateTitle(String newTitle);
  Future<Either<AppException, String>> updateContent(String newContent);
}