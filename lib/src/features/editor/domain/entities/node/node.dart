import 'package:freezed_annotation/freezed_annotation.dart';

import 'node_state.dart';
import 'node_type.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.none)
class Node with _$Node {
  factory Node({
    required String id,
    String? parent,
    required String title,
    required DateTime createdAt,
    required DateTime updatedAt,
    required NodeState state,
    
    @JsonKey(includeToJson: false, includeFromJson: false) // ignore: invalid_annotation_target
    @Default(false) bool isDecryptionError
  }) = _Node;

  @FreezedUnionValue(DbNodeTypes.folder)
  factory Node.folder({
    required String id,
    String? parent,
    @Default("") String title,
    required DateTime createdAt,
    required DateTime updatedAt,
    required NodeState state,

    @Default([]) 
    @JsonKey(includeToJson: false, includeFromJson: false) // ignore: invalid_annotation_target
    List<Node> children,

    @JsonKey(includeToJson: false, includeFromJson: false) // ignore: invalid_annotation_target
    @Default(false) bool isDecryptionError
  }) = Folder;

  @FreezedUnionValue(DbNodeTypes.note)
  factory Node.note({
    required String id,
    String? parent,
    @Default("") String title,
    required DateTime createdAt,
    required DateTime updatedAt,
    required NodeState state,

    @Default("") String content,

    @JsonKey(includeToJson: false, includeFromJson: false) // ignore: invalid_annotation_target
    @Default(false) bool isDecryptionError
  }) = Note;
  

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}