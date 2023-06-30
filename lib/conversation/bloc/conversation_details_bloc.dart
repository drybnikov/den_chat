import 'dart:async';
import 'dart:math';

import 'package:den_chat/model/conversation/conversation_message_response.dart';
import 'package:den_chat/repository/conversation_data_storage.dart';
import 'package:den_chat/repository/conversation_repository.dart';
import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'conversation_details_bloc.freezed.dart';

@Freezed(toStringOverride: true, copyWith: false)
class ConversationDetailEvent with _$ConversationDetailEvent {
  const ConversationDetailEvent._();

  const factory ConversationDetailEvent.fetchDetails(String id) = _fetchDetails;

  const factory ConversationDetailEvent.sendMessage(String message) =
      _sendMessage;

  const factory ConversationDetailEvent.addMessage(
      ConversationMessage message) = _addMessage;
}

@Freezed(toStringOverride: false, copyWith: false)
class ConversationDetailState with _$ConversationDetailState {
  const ConversationDetailState._();

  const factory ConversationDetailState.loading({
    @Default([]) List<ConversationMessage> messages,
    @Default('') String conversationId,
  }) = _loading;

  const factory ConversationDetailState.initialized({
    required List<ConversationMessage> messages,
    @Default('') String conversationId,
    @Default(false) bool isSending,
  }) = _initialized;

  const factory ConversationDetailState.error({
    required List<ConversationMessage> messages,
    @Default('') String conversationId,
    @Default('Error') String message,
    String? errorCode,
  }) = detailsError;

  bool get isSending =>
      this is _initialized && (this as _initialized).isSending;
}

@injectable
class ConversationDetailBloc
    extends Bloc<ConversationDetailEvent, ConversationDetailState> {
  final ConversationRepository _conversationRepository;
  final ConversationDataStorage _conversationDataStorage;
  final Random random = Random();
  StreamSubscription? _messagesSubscription;

  ConversationDetailBloc(
      this._conversationRepository, this._conversationDataStorage)
      : super(const _loading()) {
    on<_fetchDetails>(_onFetchDetails);
    on<_sendMessage>(_onSendMessage);
    on<_addMessage>(_onAddMessage);
  }

  @override
  close() async {
    _messagesSubscription?.cancel();
    super.close();
  }

  FutureOr<void> _onFetchDetails(_fetchDetails event, emit) async {
    emit(const _loading());
    _messagesSubscription?.cancel();
    _messagesSubscription =
        _conversationDataStorage.messagesStream(event.id).listen((message) {
      add(_addMessage(message));
    });

    try {
      final messagesResult =
          await _conversationRepository.fetchConversationMessages(event.id);

      messagesResult.sort((a, b) => a.modified.compareTo(b.modified));

      emit(_initialized(messages: messagesResult, conversationId: event.id));
    } on Object catch (error, st) {
      Fimber.e('Error when load characters', ex: error, stacktrace: st);
      if (error is DioError) {
        emit(detailsError(
          message: error.response?.data.toString() ?? error.message,
          errorCode: error.type.name,
          messages: error.response?.statusCode == 404 ? [] : state.messages,
          conversationId: event.id,
        ));
      } else {
        emit(detailsError(
          message: error.toString(),
          messages: state.messages,
          conversationId: event.id,
        ));
      }
    }
  }

  FutureOr<void> _onAddMessage(_addMessage event, emit) async {
    final messages = state.messages.toList();
    messages.add(event.message);
    await emit(
        _initialized(messages: messages, conversationId: state.conversationId));
  }

  FutureOr<void> _onSendMessage(_sendMessage event, emit) async {
    final conversationId = state.conversationId;
    emit(_initialized(
      messages: state.messages,
      conversationId: conversationId,
      isSending: true,
    ));

    await _conversationRepository.sendMessage(
      messageText: event.message,
      conversationId: conversationId,
    );
  }
}
