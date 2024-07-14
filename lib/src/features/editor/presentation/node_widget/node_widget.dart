import 'package:auto_route/auto_route.dart';
import 'package:editor_riverpod/src/core/common/build_context_ext.dart';
import 'package:editor_riverpod/src/core/common/hardcoded.dart';
import 'package:editor_riverpod/src/core/common/loggler.dart';
import 'package:editor_riverpod/src/core/presentation/constants.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node_type.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/controllers/node_widget_controller_impl.dart';
import 'package:editor_riverpod/src/features/editor/presentation/node_widget/node_widget_controller.dart';
import 'package:editor_riverpod/src/features/editor/presentation/node_widget/node_widget_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/rename_dialog.dart';


class NodeWidget extends ConsumerStatefulWidget {
  const NodeWidget({super.key, required this.node});

  final Node node;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NodeWidgetState();
}
class _NodeWidgetState extends ConsumerState<NodeWidget> {
  NodeWidgetController get cont => ref.watch(nodeWidgetControllerImplProvider(widget.node.id).notifier);
  AsyncValue<NodeWidgetState> get state => ref.watch(nodeWidgetControllerImplProvider(widget.node.id));

  FocusNode titleEditFocusNode = FocusNode();

  void toggleChildrenShown() {
    cont.toggleChildrenShown();
  }

  void onDelete() async {
    await cont.deleteThisNode();
  }

  Future<void> onAdd(NodeType type) async {
    await cont.addChild(type);
  }

  Future<void> onRename() async {
    final newTitle = await RenameDialog(
      oldName: state.asData!.value.node!.title
    ).show(context);
    if (newTitle != null) {
      await cont.updateTitle(newTitle);
    }
  }

  void onTapNode() async {
    if (state.value!.node is Note) {
      cont.selectThisNode();
      if (context.isMobile) context.maybePop();
    } else {
      toggleChildrenShown();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    return state.when(
      data: (state) {
        return buildNode(state: state);
      },
      error: (e, st) => shrink,
      loading: () => state.value == null 
        ? shrink 
        : buildNode(state: state.value!)
    );
  }

  Widget buildNode({
    required NodeWidgetState state,
  }) {
    return Column(
      key: Key(state.node!.id),
      children: [
        draggableNodeWrapper(
          state: state,
          child: Card(
            key: UniqueKey(),
            surfaceTintColor: state.node is Folder 
              ? Theme.of(context).colorScheme.tertiary
              : Colors.white,
            child: GestureDetector(
              onTap: onTapNode,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  w16gap,
                  Expanded(
                    child: Text(state.node!.title.isNotEmpty 
                      ? state.node!.title
                      : "Untitled".hardcoded
                    )
                  ),
                  buildPopupButton(state.node is Folder),
                  w8gap
                ]
              ),
            )
          ),
        ),
        if (state.isChildrenShown) buildChildren(state.nodes)
      ]
    );
  }

  draggableNodeWrapper({
    required NodeWidgetState state, 
    required Widget child
  }) {

    final draggable = Draggable<(String who, String? from)>(
      key: UniqueKey(),
      data: (state.node!.id, state.node!.parent),
      child: child, 
      feedback: Container(
        width: p256,
        child: child,
      ),
      childWhenDragging: Stack(
        children: [
          child,
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(p16)
              ),
            )
          )
        ],
      )
    );
    if (state.node is! Folder) return draggable; 
    return DragTarget<(String who, String? from)>(
      onAcceptWithDetails: (node) async {
        if (node.data.$2 == state.node?.id) return;
        await cont.moveHere(node.data);
      },
      builder: (context, candidateData, rejectedData) {
        return draggable;
      }
    );
  }

  Widget buildPopupButton(bool isFolder) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert_rounded, color: Theme.of(context).hintColor),
      tooltip: '',
      itemBuilder: (context) => [
        if (isFolder) ...[
          PopupMenuItem(
            child: Text('Add Folder'.hardcoded), 
            onTap: () => onAdd(NodeType.folder)
          ),
          PopupMenuItem(
            child: Text('Add Note'.hardcoded), 
            onTap: () => onAdd(NodeType.note)
          ),
        ],
        PopupMenuItem(
          child: Text('Rename'.hardcoded),
          onTap: onRename
        ),
        PopupMenuItem(
          child: Text('Delete'.hardcoded, 
            style: TextStyle(color: Colors.red)
          ), 
          onTap: onDelete
        ),
        // PopupMenuItem(
        //   child: Text('something'.hardcoded, 
        //     style: TextStyle(color: Colors.magenta)
        //   ), 
        //   onTap: () {
        //     print(state.nodes.length);
        //   }
        // ),
      ]
    );
  }

  Widget buildChildren(List<Node> nodes) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: nodes.map((n) => Padding(
        key: UniqueKey(),
        padding: const EdgeInsets.only(left: p16),
        child: NodeWidget(
          node: n
        )
      )).toList()
    );
  }
}