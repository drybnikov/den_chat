import 'dart:async';

import 'package:den_chat/model/conversation/conversation_response.dart';
import 'package:den_chat/repository/conversation_data_storage.dart';
import 'package:den_chat/repository/conversation_repository.dart';
import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'conversation_bloc.freezed.dart';

@Freezed(toStringOverride: true, copyWith: false)
class ConversationEvent with _$ConversationEvent {
  const ConversationEvent._();

  const factory ConversationEvent.fetchLastConversations() =
      _fetchConversations;

  const factory ConversationEvent.updateConversation(
      Conversation conversation) = _updateConversation;
}

@Freezed(toStringOverride: false, copyWith: false)
class ConversationState with _$ConversationState {
  const ConversationState._();

  const factory ConversationState.loading(
      {@Default([]) List<Conversation> conversations}) = _loading;

  const factory ConversationState.initialized(
      {required List<Conversation> conversations}) = _initialized;

  const factory ConversationState.error({
    required List<Conversation> conversations,
    @Default('Error') String message,
    String? errorCode,
  }) = conversationsError;
}

@injectable
class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final ConversationRepository _conversationRepository;
  final ConversationDataStorage _conversationDataStorage;

  StreamSubscription? _conversationsSubscription;

  ConversationBloc(this._conversationRepository, this._conversationDataStorage)
      : super(const _loading()) {
    on<_fetchConversations>(_onFetchConversations);
    on<_updateConversation>(_onUpdateConversation);

    _conversationsSubscription =
        _conversationDataStorage.conversationsStream().listen((conversation) {
      add(_updateConversation(conversation));
    });
  }

  @override
  close() {
    _conversationsSubscription?.cancel();
    return super.close();
  }

  FutureOr<void> _onFetchConversations(_fetchConversations event, emit) async {
    try {
      final conversationsResult =
          await _conversationRepository.fetchConversations();

      emit(_initialized(conversations: conversationsResult));
    } on Object catch (error, st) {
      Fimber.e('Error when load characters', ex: error, stacktrace: st);
      if (error is DioError) {
        emit(conversationsError(
          message: error.response?.data.toString() ?? error.message,
          errorCode: error.type.name,
          conversations:
              error.response?.statusCode == 404 ? [] : state.conversations,
        ));
      } else {
        emit(conversationsError(
          message: error.toString(),
          conversations: state.conversations,
        ));
      }
    }
  }

  FutureOr<void> _onUpdateConversation(_updateConversation event, emit) async {
    final conversations = state.conversations.toList();
    final conversation = event.conversation;

    final index = conversations.indexWhere(
        (element) => element.id == conversation.id && element != conversation);

    if (index != -1) {
      conversations[index] = conversation;
    } else {
      conversations.add(conversation);
    }

    emit(_initialized(conversations: conversations));
  }
}
