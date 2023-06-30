import 'package:den_chat/model/conversation/conversation_message_response.dart';
import 'package:den_chat/model/conversation/conversation_response.dart';

abstract class ConversationRepository {
  ///Fetch Conversations list for last 10 messages
  Future<List<Conversation>> fetchConversations();

  ///Fetch selected conversation messages
  Future<List<ConversationMessage>> fetchConversationMessages(String id);

  ///Send message to selected conversation
  Future<ConversationMessage> sendMessage(
      {required String messageText, required String conversationId});
}
