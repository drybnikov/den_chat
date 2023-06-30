import 'package:cached_network_image/cached_network_image.dart';
import 'package:den_chat/model/conversation/conversation_response.dart';
import 'package:flutter/material.dart';

class ConversationDetailsScreen extends StatelessWidget {
  static const path = '/conversation_details';
  final Conversation conversationModel;

  static get(Object? arguments) => (BuildContext context) =>
      ConversationDetailsScreen(conversationModel: arguments as Conversation);

  const ConversationDetailsScreen({Key? key, required this.conversationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(conversationModel.topic),
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Hero(
        tag: conversationModel.id,
        transitionOnUserGestures: true,
        child: Material(
          child: CachedNetworkImage(
            imageUrl:
                'https://picsum.photos/id/${conversationModel.id}/600/1280',
            fit: BoxFit.fill,
            imageBuilder: (context, provider) => Ink.image(
              image: provider,
              fit: BoxFit.cover,
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
          ),
        ),
      ),
    );
  }
}
