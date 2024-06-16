import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/features/editor/application/interfaces/child_deleter.dart';
import 'package:editor_riverpod/src/features/editor/application/interfaces/children_refresher.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node_type.dart';
import 'package:either_dart/either.dart';

abstract interface class NodeWidgetController implements ChildDeleter, NodeRefresher {
  Future<Either<AppException, Node>> addChild(NodeType type);
  Future<Either<AppException, void>> deleteThisNode();
  Future<Either<AppException, String>> updateTitle(String newTitle);
  /// move this node here from somewhere.
  Future<Either<AppException, void>> moveHere((String who, String? from) toMove);
  void toggleChildrenShown([bool? isChildrenShown]);
  void selectThisNode();

  @override Future<Either<AppException, void>> deleteChild(String id);
  @override Future<Either<AppException, void>> refresh([Future? awaiter]);
}