// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      id: json['id'] as String,
      topic: json['topic'] as String,
      lastMessage: json['last_message'] as String?,
      modified: json['modified_at'] == null
          ? null
          : DateTime.parse(json['modified_at'] as String),
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );
