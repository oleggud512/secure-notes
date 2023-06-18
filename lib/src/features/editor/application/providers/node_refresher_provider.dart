import 'package:editor_riverpod/src/features/editor/application/interfaces/children_refresher.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/controllers/node_widget_controller_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'node_refresher_provider.g.dart';

@riverpod
NodeRefresher nodeRefresher(NodeRefresherRef ref, String? folderId) {
  return ref.watch(nodeWidgetControllerImplProvider(folderId).notifier);
}