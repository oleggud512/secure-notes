import 'dart:async';

import 'package:editor_riverpod/src/core/application/errors/exceptions.dart';
import 'package:editor_riverpod/src/core/common/list_ext.dart';
import 'package:editor_riverpod/src/core/common/loggler.dart';
import 'package:editor_riverpod/src/features/editor/application/providers/curret_note_provider.dart';
import 'package:editor_riverpod/src/features/editor/application/providers/node_refresher_provider.dart';
import 'package:editor_riverpod/src/features/editor/application/providers/parent_folder_provider.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/create_folder_use_case.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/create_note_use_case.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/delete_node_use_case.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/get_node_use_case.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/get_tree_use_case.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/update_folder_use_case.dart';
import 'package:editor_riverpod/src/features/editor/application/use_cases/update_note_use_case.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node_type.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/controllers/editor_widget_controller_impl.dart';
import 'package:editor_riverpod/src/features/editor/presentation/node_widget/node_widget_controller.dart';
import 'package:editor_riverpod/src/features/editor/presentation/node_widget/node_widget_state.dart';
import 'package:either_dart/src/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'node_widget_controller_impl.g.dart';

@riverpod
class NodeWidgetControllerImpl extends _$NodeWidgetControllerImpl
    implements NodeWidgetController {
  
  GetNodeUseCase get _getNodeUseCase => ref.watch(getNodeUseCaseProvider);
  GetSubfoldersUseCase get _getSubfoldersUseCase => ref.watch(getSubfoldersUseCaseProvider);
  DeleteNodeUseCase get _deleteNodeUseCase => ref.watch(deleteNodeUseCaseProvider);
  CreateFolderUseCase get _createFolderUseCase => ref.watch(createFolderUseCaseProvider);
  CreateNoteUseCase get _createNoteUseCase => ref.watch(createNoteUseCaseProvider);
  UpdateNoteUseCase get _updateNoteUseCase => ref.watch(updateNoteUseCaseProvider);
  UpdateFolderUseCase get _updateFolderUseCase => ref.watch(updateFolderUseCaseProvider);

  int Function(Node, Node) get _comparator => (p, n) {
    if (p is Folder && n is Note) return -1;
    if (p is Note && n is Folder) return 1;
    return p.title.compareTo(n.title);
  };

  FutureOr<NodeWidgetState> build(String? nodeId) async {
    // TODO: ???
    final link = ref.keepAlive();
    final timer = Timer(const Duration(minutes: 5), () {
      link.close(); 
    });
    ref.onDispose(() {
      timer.cancel();
    });

    // Update state of this node if it's currently active and modified
    ref.listen(editorWidgetControllerImplProvider, (previous, next) { 
      if (nodeId != null && next.value?.note?.id == nodeId) {
        state = AsyncData(state.value!.copyWith(node: next.value!.note));
      }
    });

    final children = await _getSubfoldersUseCase.call(nodeId);

    if (nodeId == null) {
      return NodeWidgetState(
        node: null,
        nodes: children.right
      );
    }

    final node = await _getNodeUseCase.call(nodeId);

    return node.fold(
      (left) {
        glogger.i(left, stackTrace: left.stackTrace);
        return NodeWidgetState();
      },
      (node) async {
        if (!(node is Folder)) {
          return NodeWidgetState(node: node);
        }
        
        return children.fold(
          (left) {
            glogger.e(left);
            return NodeWidgetState();
          },
          (children) {
            return NodeWidgetState(
              node: node,
              nodes: children
            );
          }
        );
      }
    );
  }

  @override
  Future<Either<AppException, Node>> addChild(NodeType type) async {
    final added = type == NodeType.folder 
      ? await _createFolderUseCase.call(nodeId)
      : await _createNoteUseCase.call(nodeId);
    
    added.map((right) {
      state = AsyncData(state.value!.copyWith(
        nodes: state.value!.nodes.copyWith(right)..sort(_comparator),
        isChildrenShown: true,
      ));
    });
    
    return added;
  }

  @override
  Future<Either<AppException, void>> deleteChild(String id) async {
    final res = await _deleteNodeUseCase.call(id);
    if (res.isRight) {
      state = AsyncData(state.value!.copyWith(
        nodes: state.value!.nodes.copyWithoutWhere((n) => n.id == id)..sort(_comparator)
      ));
    }
    return res;
  }

  @override
  Future<Either<AppException, void>> deleteThisNode() async {
    if (state.value!.node!.id == ref.watch(currentNoteProvider)) {
      ref.watch(currentNoteProvider.notifier).setCurrentNote(null);
    }
    final res = await ref.watch(parentFolderProvider(state.value!.node!.parent)).deleteChild(nodeId!);
    return res;
  }
  
  @override
  Future<Either<AppException, String>> updateTitle(String newTitle) async {
    // TODO: what if there will be more types of nodes?
    final updatedNode = state.value!.node is Note 
      ? await _updateNoteUseCase.call(state.value!.node!.copyWith(title: newTitle) as Note)
      : await _updateFolderUseCase.call(state.value!.node!.copyWith(title: newTitle) as Folder);
    return updatedNode.map((right) {
      state = AsyncData(state.value!.copyWith(node: right, nodes: [...state.value!.nodes]..sort(_comparator)));
      return right.title;
    });  
  }
  
  @override
  void selectThisNode() {
    if (state.value!.node is Note) {
      ref.watch(currentNoteProvider.notifier).setCurrentNote(nodeId);
    }
  }
  
  @override
  void toggleChildrenShown([bool? isChildrenShown]) {
    state = AsyncData(state.value!.copyWith(
      isChildrenShown: isChildrenShown ?? !state.value!.isChildrenShown
    ));
  }
  
  @override
  Future<Either<AppException, void>> refresh([Future? awaiter]) async {
    // print('about to refresh $nodeId');
    final children = await _getSubfoldersUseCase.call(nodeId);
    final node = nodeId == null ? null : await _getNodeUseCase.call(nodeId!);

    if (children.isLeft || node != null && node.isLeft) return Left(AppException());

    return children.mapAsync((children) async {
      // print('${state.value!.node?.id} (${state.value!.node?.title}) - ${state.value!.nodes.length}');
      await awaiter;
      state = AsyncData(state.value!.copyWith(node: node?.right, nodes: children..sort(_comparator)));
    });
  }
  
  @override
  Future<Either<AppException, void>> moveHere(Node externalNode) async {
    if (state.value!.node?.id == externalNode.parent) {
      return Left(AppException("Node is already here"));
    }

    late Either<AppException, Node> updated;
    // update node parent and retrieve either Folder or Note
    if (externalNode is Note) {
      updated = await _updateNoteUseCase.call(externalNode.copyWith(parent: nodeId) as Note);
    } else if (externalNode is Folder) {
      updated = await _updateFolderUseCase.call(externalNode.copyWith(parent: nodeId) as Folder);
    }

    // nodes that have been changed
    await ref.read(nodeRefresherProvider(externalNode.id)).refresh();
    await ref.read(nodeRefresherProvider(externalNode.parent)).refresh();
    await refresh();

    return updated.map((right) => null);
  }
}