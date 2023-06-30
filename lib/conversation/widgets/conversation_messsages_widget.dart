import 'package:den_chat/model/conversation/conversation_message_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'member_avatar_widget.dart';

const messageHeight = 80.0;

class ConversationMessagesWidget extends StatefulWidget {
  final List<ConversationMessage> messages;

  const ConversationMessagesWidget(this.messages, {Key? key}) : super(key: key);

  @override
  State<ConversationMessagesWidget> createState() =>
      _ConversationMessagesWidgetState();
}

class _ConversationMessagesWidgetState
    extends State<ConversationMessagesWidget> {
  late final AutoScrollController controller;

  @override
  void initState() {
    controller = AutoScrollController(
      keepScrollOffset: true,
      initialScrollOffset: _getInitialOffset(),
      suggestedRowHeight: messageHeight,
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ConversationMessagesWidget oldWidget) {
    if (widget.messages.length > oldWidget.messages.length) {
      controller.scrollToIndex(widget.messages.length,
          duration: const Duration(seconds: 1));
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double _getInitialOffset() {
    final index = widget.messages.length;

    return index * messageHeight;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      controller: controller,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final listItem = widget.messages[index];

              return AutoScrollTag(
                index: index,
                key: ValueKey(index),
                controller: controller,
                child: listItem.sender == 'me'
                    ? _MyMessageListItem(listItem: listItem)
                    : _MessageListItem(listItem: listItem),
              );
            },
            childCount: widget.messages.length,
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
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MemberAvatar(member: listItem.sender),
          Expanded(
              flex: 5,
              child: Card(
                elevation: 3,
                color: Theme.of(context).scaffoldBackgroundColor,
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listItem.message,
                        maxLines: 5,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 4),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: _ModifiedDate(modified: listItem.modified),
                      ),
                    ],
                  ),
                ),
              )),
          const Expanded(child: SizedBox(width: 10)),
        ],
      ),
    );
  }
}

class _MyMessageListItem extends StatelessWidget {
  final ConversationMessage listItem;

  const _MyMessageListItem({Key? key, required this.listItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(flex: 1),
          Expanded(
            flex: 2,
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
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 4),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: _ModifiedDate(modified: listItem.modified),
                      ),
                    ],
                  )),
            ),
          ),
          MemberAvatar(member: listItem.sender),
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
