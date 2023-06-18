// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Node _$$_NodeFromJson(Map<String, dynamic> json) => _$_Node(
      id: json['id'] as String,
      parent: json['parent'] as String?,
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      state: $enumDecode(_$NodeStateEnumMap, json['state']),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$_NodeToJson(_$_Node instance) => <String, dynamic>{
      'id': instance.id,
      'parent': instance.parent,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'state': _$NodeStateEnumMap[instance.state]!,
      'type': instance.$type,
    };

const _$NodeStateEnumMap = {
  NodeState.created: 'created',
  NodeState.deleted: 'deleted',
  NodeState.updated: 'updated',
  NodeState.unchanged: 'unchanged',
};

_$Folder _$$FolderFromJson(Map<String, dynamic> json) => _$Folder(
      id: json['id'] as String,
      parent: json['parent'] as String?,
      title: json['title'] as String? ?? "",
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      state: $enumDecode(_$NodeStateEnumMap, json['state']),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FolderToJson(_$Folder instance) => <String, dynamic>{
      'id': instance.id,
      'parent': instance.parent,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'state': _$NodeStateEnumMap[instance.state]!,
      'type': instance.$type,
    };

_$Note _$$NoteFromJson(Map<String, dynamic> json) => _$Note(
      id: json['id'] as String,
      parent: json['parent'] as String?,
      title: json['title'] as String? ?? "",
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      state: $enumDecode(_$NodeStateEnumMap, json['state']),
      content: json['content'] as String? ?? "",
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$NoteToJson(_$Note instance) => <String, dynamic>{
      'id': instance.id,
      'parent': instance.parent,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'state': _$NodeStateEnumMap[instance.state]!,
      'content': instance.content,
      'type': instance.$type,
    };
