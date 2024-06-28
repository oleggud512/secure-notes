import 'package:editor_riverpod/src/core/common/debounce.dart';
import 'package:editor_riverpod/src/core/common/hardcoded.dart';
import 'package:editor_riverpod/src/core/common/loggler.dart';
import 'package:editor_riverpod/src/features/editor/infrastructure/controllers/editor_widget_controller_impl.dart';
import 'package:editor_riverpod/src/features/editor/presentation/editor/editor_widget_controller.dart';
import 'package:editor_riverpod/src/features/editor/presentation/editor/editor_widget_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';

class EditorWidget extends ConsumerStatefulWidget {
  const EditorWidget({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditorWidgetState();
}
class _EditorWidgetState extends ConsumerState<EditorWidget> {
  EditorWidgetController get cont => ref.watch(editorWidgetControllerImplProvider.notifier);
  AsyncValue<EditorWidgetState> get state => ref.watch(editorWidgetControllerImplProvider);
  
  final formKey = GlobalKey<FormState>();

  final titleDebouncer = Debouncer();
  final contentDebouncer = Debouncer();

  void onTitleChanged(String newTitle) {
    titleDebouncer.debounce(() {
      cont.updateTitle(newTitle);
    });
  }

  void onContentChanged(String newContent) {
    contentDebouncer.debounce(() {
      cont.updateContent(newContent);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    return state.when(
      data: (state) => buildWidget(context, state),
      error: (e, st) => Center(
        child: Text('something went wrong'.hardcoded)
      ),
      loading: () => state.value == null 
        ? Center(child: CircularProgressIndicator())
        : buildWidget(context, state.value!)
    );
  }

  Widget buildWidget(BuildContext context, EditorWidgetState state) {
    glogger.i("we are building the editor.... is decryption error = ${state?.note?.isDecryptionError}");
    if (state.note == null) {
      return Center(
        child: Text('Open a note'.hardcoded, 
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Theme.of(context).hintColor
          )
        )
      );
    }
    
    if (state.note!.isDecryptionError == true) {
      return Center(
        child: Text("INCORRECT PASSWORD".hardcoded)
      );
    }

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              key: Key(state.note!.id),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildTitle(context, state),
                  buildContent(state),
                  buildGap(context)
                ]
              ),
            ),
          ),
          buildCounter(context, state)
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context, EditorWidgetState state) {
    return TextFormField(
      initialValue: state.note!.title,
      onChanged: onTitleChanged,
      validator: (s) {
        if (s == null || s.isEmpty) return 'ENTER A TITLE'.hardcoded;
        return null;
      },
      style: Theme.of(context).textTheme.headlineMedium,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Untitled'.hardcoded,
      ),
    );
  }

  Widget buildContent(EditorWidgetState state) {
    return TextFormField(
      initialValue: state.note!.content,
      onChanged: onContentChanged,
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Write something...'.hardcoded,
      ),
    );
  }

  Widget buildGap(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2
    );
  }

  Widget buildCounter(BuildContext context, EditorWidgetState state) {
    return Text("${state.note!.content.length}",
      textAlign: TextAlign.end,
      style: Theme.of(context).textTheme.labelMedium
    );
  }

}