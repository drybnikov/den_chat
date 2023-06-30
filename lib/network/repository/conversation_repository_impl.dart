import 'dart:convert';

import 'package:den_chat/model/conversation/conversation_message_response.dart';
import 'package:den_chat/model/conversation/conversation_response.dart';
import 'package:den_chat/network/rest_client_public.dart';
import 'package:den_chat/repository/conversation_data_storage.dart';
import 'package:den_chat/repository/conversation_repository.dart';
import 'package:fimber/fimber.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ConversationRepository)
class ConversationRepositoryImpl implements ConversationRepository {
  final RestClientPublic _restClient;
  final ConversationDataStorage _conversationDataStorage;

  ConversationRepositoryImpl(this._restClient, this._conversationDataStorage);

  @override
  Future<List<Conversation>> fetchConversations() async {
    final storedConversations = _conversationDataStorage.getConversations();
    Fimber.d('Stored conversation: ${storedConversations.length}');
    if (storedConversations.isNotEmpty) {
      return storedConversations;
    }

    try {
      final response = await _restClient.getConversations();
      final jsonData = json.decode(response.normalizeJsonString);

      final conversationsList =
          jsonData.map<Conversation>((e) => Conversation.fromJson(e)).toList();

      _conversationDataStorage.storeConversations(conversationsList);
      return conversationsList;
    } on Exception catch (ex, st) {
      Fimber.e('Error when load conversations', ex: ex, stacktrace: st);
      rethrow;
    }
  }

  @override
  Future<List<ConversationMessage>> fetchConversationMessages(String id) async {
    final storedMessages = _conversationDataStorage.getConversationMessages(id);
    Fimber.d('Stored messages[$id]: ${storedMessages.length}');
    if (storedMessages.isNotEmpty) {
      return storedMessages;
    }

    final response = await _restClient.getConversationMessages(id);
    final jsonData = json.decode(response.normalizeJsonString);

    final messagesList = jsonData
        .map<ConversationMessage>((e) => ConversationMessage.fromJson(e))
        .toList();

    _conversationDataStorage.storeConversationMessages(id, messagesList);

    return messagesList;
  }

  Future<ConversationMessage> sendMessage(
      {required String message, required String id}) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}

extension JsonNormalizer on String {
  String get normalizeJsonString => replaceFirst(',]', ']');
}
