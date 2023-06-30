import 'package:den_chat/model/conversation/conversation_response.dart';
import 'package:den_chat/network/client_provider.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client_public.g.dart';

@RestApi(
  baseUrl:
      'https://jefe-stg-media-bucket.s3.amazonaws.com/programming-test/api',
)
@lazySingleton
abstract class RestClientPublic {
  @factoryMethod
  factory RestClientPublic(ClientProvider clientProvider) {
    return _RestClientPublic(clientProvider.client);
  }

  /// Get latest conversations list
  @GET('/inbox.json')
  Future<List<Conversation>> getConversations();

  /// Get selected conversation details
  @GET('/{id}.json')
  Future<Conversation> getConversationDetails(
    @Path() String id,
  );
}
