import 'package:den_chat/conversation/conversation_details_screen.dart';
import 'package:den_chat/conversation/widgets/member_avatar_widget.dart';
import 'package:den_chat/model/conversation/conversation_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(ConversationDetailsScreen.path, arguments: listItem),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      listItem.topic,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _ModifiedDate(modified: listItem.modified ?? 0),
                      _MembersListWidget(members: listItem.members),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              Chip(
                avatar: const Icon(Icons.message, size: 16),
                labelPadding: const EdgeInsets.only(left: 4, right: 4),
                label: Text(
                  listItem.lastMessage ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MembersListWidget extends StatelessWidget {
  final List<String> members;

  const _MembersListWidget({required this.members});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final member = members[index];

          return Padding(
            padding: const EdgeInsets.only(left: 4),
            child: MemberAvatar(member: member),
          );
        },
        itemCount: members.length,
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
      style: Theme.of(context).primaryTextTheme.caption,
    );
  }
}
