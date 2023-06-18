import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'curret_note_provider.g.dart';

@riverpod
class CurrentNote extends _$CurrentNote {
  @override
  String? build() {
    return null;
  }

  setCurrentNote(String? id) {
    state = id;
  }
}