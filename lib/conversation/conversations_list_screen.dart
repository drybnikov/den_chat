import 'package:den_chat/conversation/bloc/conversation_bloc.dart';
import 'package:den_chat/conversation/network_error.dart';
import 'package:den_chat/conversation/widgets/about_info_action_widget.dart';
import 'package:den_chat/conversation/widgets/conversations_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationsListScreen extends StatelessWidget {
  static const path = '/conversations_list';

  static get(Object? arguments) =>
      (BuildContext context) => const ConversationsListScreen();

  const ConversationsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deni-tron chat'),
        elevation: 0,
        actions: const [
          AboutInfoActionWidget(),
        ],
      ),
      body: const _PhotosListBody(),
    );
  }
}

class _PhotosListBody extends StatelessWidget {
  const _PhotosListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationBloc, ConversationState>(
      builder: (context, state) => state.maybeMap(
        loading: (_) => const ListLoading(),
        error: (error) => error.conversations.isEmpty
            ? NetworkErrorWidget(
                message: error.message,
                errorCode: error.errorCode,
              )
            : ConversationsListWidget(conversations: error.conversations),
        orElse: () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: ConversationsListWidget(conversations: state.conversations),
        ),
      ),
    );
  }
}

class ListLoading extends StatelessWidget {
  const ListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
