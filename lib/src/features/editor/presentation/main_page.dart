import 'package:auto_route/auto_route.dart';
import 'package:editor_riverpod/src/core/common/build_context_ext.dart';
import 'package:editor_riverpod/src/core/presentation/constants.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/controllers/editor_widget_controller_impl.dart';
import 'package:editor_riverpod/src/features/editor/presentation/editor/editor_widget.dart';
import 'package:editor_riverpod/src/features/editor/presentation/main_drawer/main_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:editor_riverpod/src/features/local_auth/infrastructure/services/auth_service_provider.dart';

@RoutePage()
class MainPage extends ConsumerWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (context.isMobile) {
      return buildMobile(context, ref);
    }
    return buildLarger(context, ref);
  }

  Widget buildMobile(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(ref.watch(editorWidgetControllerImplProvider).value?.note?.title ?? "Open a note")),
      body: Padding(
        padding: const EdgeInsets.all(p16),
        child: EditorWidget(),
      ),
      drawer: Drawer(
        child: Container(
          child: SafeArea(
            child: MainDrawer()
          ),
        )
      )
    );
  }

  Widget buildLarger(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: p312,
            child: MainDrawer()
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: p16, bottom: p16, right: p16),
            child: EditorWidget(),
          )),
        ],
      ),
    );
  }
}