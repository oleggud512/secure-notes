import 'package:editor_riverpod/src/features/editor/application/interfaces/child_deleter.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/controllers/node_widget_controller_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'parent_folder_provider.g.dart';

@riverpod
ChildDeleter parentFolder(ParentFolderRef ref, String? nodeId) {
  return ref.watch(nodeWidgetControllerImplProvider(nodeId).notifier);
}