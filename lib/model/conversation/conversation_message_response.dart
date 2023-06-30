import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation_message_response.g.dart';

@JsonSerializable()
class ConversationMessage extends Equatable {
  final String id;
  final String message;
  final String sender;

  @JsonKey(name: 'modified_at')
  final int modified;

  const ConversationMessage.empty()
      : id = '',
        message = '',
        sender = '',
        modified = 0;

  const ConversationMessage({
    required this.id,
    required this.message,
    required this.sender,
    required this.modified,
  });

  @override
  List<Object?> get props => [id, message, sender, modified];

  factory ConversationMessage.fromJson(Map<String, dynamic> json) =>
      _$ConversationMessageFromJson(json);

  @override
  String toString() =>
      'ConversationMessage(id:$id, message:$message, sender:$sender, modified:$modified)';
}
