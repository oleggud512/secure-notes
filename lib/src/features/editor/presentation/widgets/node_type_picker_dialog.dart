import 'dart:async';

import 'package:editor_riverpod/src/core/common/hardcoded.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node_type.dart';
import 'package:flutter/material.dart';

class NodeTypePickerButton extends StatelessWidget {
  const NodeTypePickerButton({
    super.key,
    required this.onTypeSelected
  });

  final FutureOr<void> Function(NodeType type) onTypeSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<NodeType>(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: NodeType.folder,
            child: Text("Folder".hardcoded),
          ),
          PopupMenuItem(
            value: NodeType.note,
            child: Text("Note".hardcoded)
          )
        ];
      },
      onSelected: onTypeSelected,
      child: Icon(Icons.add),
    );
  }
}