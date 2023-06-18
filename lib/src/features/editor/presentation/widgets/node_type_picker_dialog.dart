import 'package:editor_riverpod/src/core/common/hardcoded.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node_type.dart';
import 'package:flutter/material.dart';

class NodeTypePicker extends StatelessWidget {
  const NodeTypePicker({super.key});

  static Future<NodeType?> show(BuildContext context) async {
    return await showDialog(
      context: context, 
      builder: (context) {
        return NodeTypePicker();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        SimpleDialogOption(
          child: Text('Folder'.hardcoded),
          onPressed: () => Navigator.of(context).pop(NodeType.folder),
        ),
        SimpleDialogOption(
          child: Text('Note'.hardcoded),
          onPressed: () => Navigator.of(context).pop(NodeType.note),
        ),
      ],
    );
  }
}