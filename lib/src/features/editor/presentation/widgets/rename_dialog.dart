import 'package:auto_route/auto_route.dart';
import 'package:editor_riverpod/src/core/common/hardcoded.dart';
import 'package:editor_riverpod/src/core/presentation/constants.dart';
import 'package:editor_riverpod/src/core/presentation/dialog_widget.dart';
import 'package:flutter/material.dart';

class RenameDialog extends StatefulWidget with DialogWidget<String> {
  const RenameDialog({
    super.key,
    required this.oldName
  });

  final String oldName;

  @override
  State<RenameDialog> createState() => _RenameDialogState();
}

class _RenameDialogState extends State<RenameDialog> {
  final cont = TextEditingController();

  @override
  void initState() { 
    super.initState();
    cont.text = widget.oldName;
    cont.selection = TextSelection(
      baseOffset: 0, 
      extentOffset: widget.oldName.length
    );
  }

  void onRename() {
    final newName = cont.text;
    Navigator.of(context).pop(newName);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: p400
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: cont,
                  onFieldSubmitted: (_) {
                    onRename();
                  },
                ),
                FilledButton(
                  child: Text('Rename'.hardcoded),
                  onPressed: onRename
                )
              ]
            )
          )
        )
      )
    );
  }
}