// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationMessageImpl _$$ConversationMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationMessageImpl(
      id: json['id'] as String,
      orgId: json['orgId'] as String,
      sessionId: json['sessionId'] as String,
      role: json['role'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ConversationMessageImplToJson(
        _$ConversationMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orgId': instance.orgId,
      'sessionId': instance.sessionId,
      'role': instance.role,
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
      if (instance.metadata case final value?) 'metadata': value,
    };
