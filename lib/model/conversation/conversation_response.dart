import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation_response.g.dart';

@JsonSerializable()
class Conversation extends Equatable {
  final String id;
  final String topic;

  @JsonKey(name: 'last_message')
  final String? lastMessage;
  @JsonKey(name: 'modified_at')
  final int? modified;

  final List<String> members;

  const Conversation({
    required this.id,
    required this.topic,
    this.lastMessage,
    this.modified,
    this.members = const [],
  });

  @override
  List<Object?> get props => [id, topic, lastMessage, modified];

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  @override
  String toString() =>
      'Conversation(id:$id, topic:$topic, lastMessage:$lastMessage, modified:$modified)';

  Conversation copyWith({
    String? id,
    String? topic,
    String? lastMessage,
    int? modified,
    List<String>? members,
  }) {
    return Conversation(
      id: id ?? this.id,
      topic: topic ?? this.topic,
      lastMessage: lastMessage ?? this.lastMessage,
      modified: modified ?? this.modified,
      members: members ?? this.members,
    );
  }
}
