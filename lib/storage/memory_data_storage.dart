import 'dart:async';

import 'package:den_chat/model/conversation/conversation_message_response.dart';
import 'package:den_chat/model/conversation/conversation_response.dart';
import 'package:fimber/fimber.dart';
import 'package:injectable/injectable.dart';

import '../repository/conversation_data_storage.dart';

@LazySingleton(as: ConversationDataStorage)
class MemoryDataStorage implements ConversationDataStorage {
  final List<Conversation> _conversations = [];
  final Map<String, List<ConversationMessage>> _messages = {};

  final StreamController<Conversation> _conversationsStreamController =
      StreamController.broadcast();

  final Map<String, StreamController<ConversationMessage>> _messagesStreamMap =
      {};

  @override
  void updateConversation(Conversation conversation) {
    final index =
        _conversations.indexWhere((element) => element.id == conversation.id);
    if (index != -1) {
      _conversations[index] = conversation;
      _conversationsStreamController.add(conversation);
    }
  }

  @override
  void storeConversations(List<Conversation> conversations) {
    _conversations.clear();
    _conversations.addAll(conversations);
  }

  @override
  void storeConversationMessages(
      String conversationId, List<ConversationMessage> messages) {
    _messages[conversationId] = messages;
  }

  @override
  List<Conversation> getConversations() => _conversations;

  @override
  List<ConversationMessage> getConversationMessages(String conversationId) =>
      _messages[conversationId] ?? [];

  @override
  Stream<ConversationMessage> messagesStream(String conversationId) {
    if (!_messagesStreamMap.containsKey(conversationId)) {
      _messagesStreamMap[conversationId] = StreamController.broadcast();
    }

    return _messagesStreamMap[conversationId]!.stream;
  }

  StreamController<ConversationMessage> _getStreamController(String id) {
    if (!_messagesStreamMap.containsKey(id)) {
      _messagesStreamMap[id] = StreamController.broadcast();
    }

    return _messagesStreamMap[id]!;
  }

  @override
  Stream<Conversation> conversationsStream() =>
      _conversationsStreamController.stream;

  @override
  Future<ConversationMessage> sendMessage(
      {required String messageText,
      required String sender,
      required String conversationId}) async {
    Fimber.d('sendMessage: $messageText, $sender, $conversationId}');

    final messages = getConversationMessages(conversationId).toList();
    final nextId = (int.tryParse(messages.last.id) ?? 0) + 1;

    final message = ConversationMessage(
      id: nextId.toString(),
      message: messageText,
      modified: DateTime.now().microsecondsSinceEpoch,
      sender: sender,
    );

    //Send new message to stream
    _getStreamController(conversationId).sink.add(message);
    messages.add(message);

    ///Store new message
    storeConversationMessages(conversationId, messages);

    return message;
  }
}
