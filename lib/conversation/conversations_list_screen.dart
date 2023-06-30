import 'package:den_chat/conversation/bloc/conversation_bloc.dart';
import 'package:den_chat/conversation/widgets/about_info_action_widget.dart';
import 'package:den_chat/conversation/widgets/photos_grid_widget.dart';
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
        loading: (_) => const _ListLoading(),
        orElse: () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: ConversationsListWidget(conversations: state.conversations),
        ),
      ),
    );
  }
}

class _ListLoading extends StatelessWidget {
  const _ListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
