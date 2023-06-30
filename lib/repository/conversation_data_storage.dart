import 'package:den_chat/model/conversation/conversation_message_response.dart';
import 'package:den_chat/model/conversation/conversation_response.dart';

abstract class ConversationDataStorage {
  ///Fetch Conversations from data storage
  List<Conversation> getConversations();

  ///Fetch selected conversation messages from data storage
  List<ConversationMessage> getConversationMessages(String conversationId);

  ///Send message to selected conversation
  Future<ConversationMessage> sendMessage(
      {required String messageText,
      required String sender,
      required String conversationId});

  ///Stream of new messages from selected conversation
  Stream<ConversationMessage> messagesStream(String conversationId);

  ///Stream of Conversation updates
  Stream<Conversation> conversationsStream();

  ///Update conversation in data storage
  void updateConversation(Conversation conversation);

  ///Store conversations in data storage
  void storeConversations(List<Conversation> conversations);

  ///Store conversation messages in data storage
  void storeConversationMessages(
      String conversationId, List<ConversationMessage> messages);
}
