import 'package:den_chat/model/conversation/conversation_message_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'member_avatar_widget.dart';

class ConversationMessagesWidget extends StatelessWidget {
  final List<ConversationMessage> messages;

  const ConversationMessagesWidget({Key? key, required this.messages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final listItem = messages[index];

              return _MessageListItem(listItem: listItem);
            },
            childCount: messages.length,
          ),
        ),
      ],
    );
  }
}

class _MessageListItem extends StatelessWidget {
  final ConversationMessage listItem;

  const _MessageListItem({Key? key, required this.listItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MemberAvatar(member: listItem.sender),
          Expanded(
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listItem.message,
                      maxLines: 5,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: _ModifiedDate(modified: listItem.modified),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModifiedDate extends StatelessWidget {
  late final String _date;
  final DateFormat formatter = DateFormat('dd MMM HH:mm');

  _ModifiedDate({required int modified}) : super() {
    final dateTime = DateTime.fromMicrosecondsSinceEpoch(modified * 1000);

    _date = formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _date,
      maxLines: 1,
      style: Theme.of(context)
          .textTheme
          .caption!
          .copyWith(color: Theme.of(context).colorScheme.primary),
    );
  }
}
