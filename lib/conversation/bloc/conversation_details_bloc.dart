import 'dart:async';
import 'dart:math';

import 'package:den_chat/model/conversation/conversation_message_response.dart';
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
}

@Freezed(toStringOverride: false, copyWith: false)
class ConversationDetailState with _$ConversationDetailState {
  const ConversationDetailState._();

  const factory ConversationDetailState.loading(
      {@Default([]) List<ConversationMessage> messages}) = _loading;

  const factory ConversationDetailState.initialized({
    required List<ConversationMessage> messages,
    @Default(false) bool isSending,
  }) = _initialized;

  const factory ConversationDetailState.error({
    required List<ConversationMessage> messages,
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
  final Random random = Random();

  ConversationDetailBloc(this._conversationRepository)
      : super(const _loading()) {
    on<_fetchDetails>(_onFetchDetails);
    on<_sendMessage>(_onSendMessage);
  }

  FutureOr<void> _onFetchDetails(_fetchDetails event, emit) async {
    emit(const _loading());

    try {
      final messagesResult =
          await _conversationRepository.fetchConversationMessages(event.id);

      messagesResult.sort((a, b) => a.modified.compareTo(b.modified));

      emit(_initialized(messages: messagesResult));
    } on Object catch (error, st) {
      Fimber.e('Error when load characters', ex: error, stacktrace: st);
      if (error is DioError) {
        emit(detailsError(
          message: error.response?.data.toString() ?? error.message,
          errorCode: error.type.name,
          messages: error.response?.statusCode == 404 ? [] : state.messages,
        ));
      } else {
        emit(detailsError(
          message: error.toString(),
          messages: state.messages,
        ));
      }
    }
  }

  FutureOr<void> _onSendMessage(_sendMessage event, emit) async {
    emit(_initialized(messages: state.messages, isSending: true));

    final delay = random.nextInt(300);
    await _sendAnswerMessage(
      'me',
      event.message,
      delay,
      emit,
    );

    await _sendRandomAnswer(emit);
  }

  FutureOr<void> _sendRandomAnswer(emit) async {
    final senderName = state.messages.first.sender;

    final delay = random.nextInt(2000);
    await _sendAnswerMessage(
      senderName,
      messageAnswers[random.nextInt(messageAnswers.length)],
      delay,
      emit,
    );
  }

  FutureOr<void> _sendAnswerMessage(
      String sender, String messageText, int delay, emit) async {
    final messages = state.messages.toList();
    final nextId = (int.tryParse(messages.last.id) ?? 0) + 1;

    final message = ConversationMessage(
      id: nextId.toString(),
      message: messageText,
      modified: DateTime.now().microsecondsSinceEpoch,
      sender: sender,
    );

    await Future.delayed(Duration(milliseconds: delay));

    messages.add(message);
    emit(_initialized(
      messages: messages,
      isSending: false,
    ));
  }
}

const List<String> messageAnswers = [
  'Yes',
  'No',
  'Maybe',
  'I don\'t know',
  'I\'m not sure',
  'I\'m sure',
  'What do you think?',
  'Why?',
  'Give me a minute',
  'I\'m busy',
  'I\'m not busy',
  'Can we watch a movie?',
  'I want to go to the cinema',
  'Tomorrow it will rain',
  'I have some plans',
  'I have to go',
  'She says she\'s not going',
];
