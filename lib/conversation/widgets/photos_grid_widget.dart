import 'package:den_chat/model/conversation/conversation_response.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';

class ConversationsListWidget extends StatelessWidget {
  final List<Conversation> conversations;

  const ConversationsListWidget({Key? key, required this.conversations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final listItem = conversations[index];
              Fimber.d('build listItem:$listItem');

              return _ConversationListItem(listItem: listItem);
            },
            childCount: conversations.length,
          ),
        ),
      ],
    );
  }
}

class _ConversationListItem extends StatelessWidget {
  final Conversation listItem;

  const _ConversationListItem({Key? key, required this.listItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Text(
              listItem.topic,
              maxLines: 1,
              style: Theme.of(context).textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
