import 'package:den_chat/conversation/bloc/conversation_details_bloc.dart';
import 'package:den_chat/conversation/conversations_list_screen.dart';
import 'package:den_chat/conversation/network_error.dart';
import 'package:den_chat/conversation/widgets/conversation_messsages_widget.dart';
import 'package:den_chat/conversation/widgets/send_message_widget.dart';
import 'package:den_chat/model/conversation/conversation_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationDetailsScreen extends StatelessWidget {
  static const path = '/conversation_details';
  final Conversation conversationModel;

  static get(Object? arguments) => (BuildContext context) =>
      ConversationDetailsScreen(conversationModel: arguments as Conversation);

  const ConversationDetailsScreen({Key? key, required this.conversationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        FocusScope.of(context).unfocus(),
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Text(conversationModel.topic),
        ),
        body: ConversationDetailsBody(conversationModel: conversationModel),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            right: 16,
          ),
          child: const SendMessageWidget(),
        ),
      ),
    );
  }
}

class ConversationDetailsBody extends StatefulWidget {
  final Conversation conversationModel;

  const ConversationDetailsBody({Key? key, required this.conversationModel})
      : super(key: key);

  @override
  State<ConversationDetailsBody> createState() =>
      _ConversationDetailsBodyState();
}

class _ConversationDetailsBodyState extends State<ConversationDetailsBody> {
  @override
  void initState() {
    context
        .read<ConversationDetailBloc>()
        .add(ConversationDetailEvent.fetchDetails(widget.conversationModel.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationDetailBloc, ConversationDetailState>(
      builder: (context, state) => state.maybeMap(
        loading: (_) => const ListLoading(),
        error: (error) => error.messages.isEmpty
            ? NetworkErrorWidget(
                message: error.message,
                errorCode: error.errorCode,
              )
            : ConversationMessagesWidget(state.messages),
        orElse: () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: ConversationMessagesWidget(state.messages),
        ),
      ),
    );
  }
}
