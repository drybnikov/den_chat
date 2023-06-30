import 'dart:async';

import 'package:den_chat/model/conversation/conversation_response.dart';
import 'package:den_chat/repository/conversation_repository.dart';
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

  const factory ConversationEvent.fetchDetails(String id) = _fetchDetails;

  const factory ConversationEvent.sendMessage(String message) = _sendMessage;
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

  ConversationBloc(this._conversationRepository) : super(const _loading()) {
    on<_fetchConversations>(_onFetchConversations);
    on<_fetchDetails>(_onFetchDetails);
    on<_sendMessage>(_onSendMessage);
  }

  FutureOr<void> _onFetchConversations(_fetchConversations event, emit) async {
    try {
      final conversationsResult =
          await _conversationRepository.fetchConversations();

      emit(_initialized(conversations: conversationsResult));
    } on Object catch (error, st) {
      Fimber.e('Error when load conversations', ex: error, stacktrace: st);
      emit(conversationsError(
        message: error.toString(),
        conversations: state.conversations,
      ));
    }
  }

  FutureOr<void> _onFetchDetails(_fetchDetails event, emit) async {}

  FutureOr<void> _onSendMessage(_sendMessage event, emit) async {}
}
