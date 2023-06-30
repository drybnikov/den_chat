import 'dart:convert';

import 'package:den_chat/model/conversation/conversation_response.dart';
import 'package:den_chat/network/rest_client_public.dart';
import 'package:den_chat/repository/conversation_repository.dart';
import 'package:fimber/fimber.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ConversationRepository)
class ConversationRepositoryImpl implements ConversationRepository {
  final RestClientPublic _restClient;

  ConversationRepositoryImpl(this._restClient);

  @override
  Future<List<Conversation>> fetchConversations() async {
    try {
      final response = await _restClient.getConversations();
      final jsonData = json.decode(response.replaceFirst(',]', ']'));
      return jsonData
          .map<Conversation>((e) => Conversation.fromJson(e))
          .toList();
    } on Exception catch (ex, st) {
      Fimber.e('Error when load conversations', ex: ex, stacktrace: st);
      rethrow;
    }
  }
}
