// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationMessage _$ConversationMessageFromJson(Map<String, dynamic> json) =>
    ConversationMessage(
      id: json['id'] as String,
      message: json['message'] as String,
      sender: json['sender'] as String,
      modified: json['modified_at'] as int,
    );

Map<String, dynamic> _$ConversationMessageToJson(
        ConversationMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'sender': instance.sender,
      'modified_at': instance.modified,
    };
