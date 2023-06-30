import 'package:den_chat/conversation/bloc/conversation_bloc.dart';
import 'package:den_chat/conversation/conversation_details_screen.dart';
import 'package:den_chat/conversation/conversations_list_screen.dart';
import 'package:den_chat/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Map<String, Function> _navigatorRoutes = {
  ConversationsListScreen.path: (args) => ConversationsListScreen.get(args),
  ConversationDetailsScreen.path: (args) => ConversationDetailsScreen.get(args),
};

class RootNavigatorWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');

  final _heroController = HeroController();

  RootNavigatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<ConversationBloc>()
            ..add(const ConversationEvent.fetchLastConversations()),
        ),
      ],
      child: WillPopScope(
        onWillPop: () async {
          var canPop = await _rootNavigatorKey.currentState?.maybePop();
          return !(canPop ?? false);
        },
        child: Navigator(
          key: _rootNavigatorKey,
          observers: [_heroController],
          onGenerateRoute: _onGenerateRoute,
        ),
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    final builder = _navigatorRoutes.containsKey(settings.name)
        ? _navigatorRoutes[settings.name]!(settings.arguments)
        : initialRouteBuilder;

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }

  Function get initialRouteBuilder => ConversationsListScreen.get(null);
}
