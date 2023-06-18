import 'package:auto_route/auto_route.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/controllers/node_widget_controller_impl.dart';
import 'package:editor_riverpod/src/features/editor/presentation/node_widget/node_widget.dart';
import 'package:editor_riverpod/src/features/editor/presentation/widgets/node_type_picker_dialog.dart';
import 'package:editor_riverpod/src/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/infrastructure/data_sources/database/database_provider.dart';
import '../../../../core/presentation/constants.dart';
import '../../../local_auth/infrastructure/services/auth_service_impl.dart';
import '../../domain/entities/node/node.dart';
import '../node_widget/node_widget_controller.dart';
import '../node_widget/node_widget_state.dart';

class MainDrawer extends ConsumerStatefulWidget {
  const MainDrawer({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainDrawerState();
}
class _MainDrawerState extends ConsumerState<MainDrawer> {
  NodeWidgetController get nodeCont => ref.watch(nodeWidgetControllerImplProvider(null).notifier);
  AsyncValue<NodeWidgetState> get state => ref.watch(nodeWidgetControllerImplProvider(null));
  
  void onAddNode() async {
    final type = await NodeTypePicker.show(context);
    if (type == null) return;
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
            child: Text('Exit'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: p4),
            child: Row(
              children: [
                IconButton(onPressed: onShowSettings, icon: Icon(Icons.settings)),
                Spacer(),
                IconButton(onPressed: onAddNode, icon: Icon(Icons.add))
              ],
            ),
          ),
          ...state.nodes.map((n) => NodeWidget(node: n)),
          DragTarget<(String who, String from)>(
            onAccept: (data) {
              nodeCont.moveHere(data);
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
        print(e);
        print(st);
        return Text('er');
      },
      loading: () => shrink
    );
  }
}