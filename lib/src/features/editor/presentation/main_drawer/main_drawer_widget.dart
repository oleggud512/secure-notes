import 'package:auto_route/auto_route.dart';
import 'package:editor_riverpod/src/core/common/hardcoded.dart';
import 'package:editor_riverpod/src/core/common/loggler.dart';
import 'package:editor_riverpod/src/features/editor/domain/entities/node/node_type.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/controllers/node_widget_controller_impl.dart';
import 'package:editor_riverpod/src/features/editor/presentation/node_widget/node_widget.dart';
import 'package:editor_riverpod/src/features/editor/presentation/widgets/node_type_picker_dialog.dart';
import 'package:editor_riverpod/src/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/constants.dart';
import 'package:editor_riverpod/src/features/local_auth/application/auth_service_provider.dart';
import '../node_widget/node_widget_controller.dart';
import '../node_widget/node_widget_state.dart';

class MainDrawer extends ConsumerStatefulWidget {
  const MainDrawer({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainDrawerState();
}
class _MainDrawerState extends ConsumerState<MainDrawer> {
  // TODO: Use MainDrawerController to watch password update.
  // Watch top-level node changes
  AsyncValue<NodeWidgetState> get state => ref.watch(nodeWidgetControllerImplProvider(null));
  NodeWidgetController get nodeCont => ref.watch(nodeWidgetControllerImplProvider(null).notifier);
  
  void onAddNode(NodeType type) async {
    await nodeCont.addChild(type);
  }

  void onShowSettings() async {
    context.pushRoute(SettingsRoute());
    // final db = ref.watch(databaseProvider).value!;
    // print((await db.rawQuery('SELECT * FROM nodes')));
    // print((await db.rawQuery('SELECT * FROM nodes')).length);
    // await db.rawDelete('DELETE FROM nodes');
  }

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    return state.when(
      data: (state) => ListView(
        padding: const EdgeInsets.all(p8),
        children: [
          FilledButton(
            onPressed: () async {
              ref.watch(authServiceProvider).localSignOut();
            }, 
            child: Text('Exit'.hardcoded),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: p4),
            child: Row(
              children: [
                IconButton(
                  onPressed: onShowSettings, 
                  icon: Icon(Icons.settings)
                ),
                Spacer(),
                NodeTypePickerButton(
                  onTypeSelected: onAddNode
                )
              ],
            ),
          ),
          ...state.nodes.map((n) => NodeWidget(node: n)),
          DragTarget<(String who, String from)>(
            onAcceptWithDetails: (data) {
              nodeCont.moveHere(data.data);
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                height: 300,
                color: candidateData.isEmpty 
                  ? Colors.transparent 
                  : Colors.black.withOpacity(0.05),
              );
            }
          )
        ]
      ),
      error: (e, st) {
        glogger.e(e, stackTrace: st);
        return Center(
          child: Text('Main Drawer Error'.hardcoded)
        );
      },
      loading: () => shrink
    );
  }
}