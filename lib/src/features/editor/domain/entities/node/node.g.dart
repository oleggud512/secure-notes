// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NodeImpl _$$NodeImplFromJson(Map<String, dynamic> json) => _$NodeImpl(
      id: json['id'] as String,
      parent: json['parent'] as String?,
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      state: $enumDecode(_$NodeStateEnumMap, json['state']),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$NodeImplToJson(_$NodeImpl instance) =>
    <String, dynamic>{
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

_$FolderImpl _$$FolderImplFromJson(Map<String, dynamic> json) => _$FolderImpl(
      id: json['id'] as String,
      parent: json['parent'] as String?,
      title: json['title'] as String? ?? "",
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      state: $enumDecode(_$NodeStateEnumMap, json['state']),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FolderImplToJson(_$FolderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent': instance.parent,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'state': _$NodeStateEnumMap[instance.state]!,
      'type': instance.$type,
    };

_$NoteImpl _$$NoteImplFromJson(Map<String, dynamic> json) => _$NoteImpl(
      id: json['id'] as String,
      parent: json['parent'] as String?,
      title: json['title'] as String? ?? "",
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      state: $enumDecode(_$NodeStateEnumMap, json['state']),
      content: json['content'] as String? ?? "",
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$NoteImplToJson(_$NoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent': instance.parent,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'state': _$NodeStateEnumMap[instance.state]!,
      'content': instance.content,
      'type': instance.$type,
    };
