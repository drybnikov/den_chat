import 'package:den_chat/model/conversation/conversation_response.dart';

abstract class ConversationRepository {
  ///Fetch Conversations list for last 10 messages
  Future<List<Conversation>> fetchConversations();
}
