// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      id: json['id'] as String,
      topic: json['topic'] as String,
      lastMessage: json['last_message'] as String?,
      modified: json['modified_at'] as int?,
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'last_message': instance.lastMessage,
      'modified_at': instance.modified,
      'members': instance.members,
    };
