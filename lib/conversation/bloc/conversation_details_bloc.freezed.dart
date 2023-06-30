// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConversationDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) fetchDetails,
    required TResult Function(String message) sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? fetchDetails,
    TResult? Function(String message)? sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? fetchDetails,
    TResult Function(String message)? sendMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetchDetails value) fetchDetails,
    required TResult Function(_sendMessage value) sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_fetchDetails value)? fetchDetails,
    TResult? Function(_sendMessage value)? sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetchDetails value)? fetchDetails,
    TResult Function(_sendMessage value)? sendMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_fetchDetails extends _fetchDetails {
  const _$_fetchDetails(this.id) : super._();

  @override
  final String id;

  @override
  String toString() {
    return 'ConversationDetailEvent.fetchDetails(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_fetchDetails &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) fetchDetails,
    required TResult Function(String message) sendMessage,
  }) {
    return fetchDetails(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? fetchDetails,
    TResult? Function(String message)? sendMessage,
  }) {
    return fetchDetails?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? fetchDetails,
    TResult Function(String message)? sendMessage,
    required TResult orElse(),
  }) {
    if (fetchDetails != null) {
      return fetchDetails(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetchDetails value) fetchDetails,
    required TResult Function(_sendMessage value) sendMessage,
  }) {
    return fetchDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_fetchDetails value)? fetchDetails,
    TResult? Function(_sendMessage value)? sendMessage,
  }) {
    return fetchDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetchDetails value)? fetchDetails,
    TResult Function(_sendMessage value)? sendMessage,
    required TResult orElse(),
  }) {
    if (fetchDetails != null) {
      return fetchDetails(this);
    }
    return orElse();
  }
}

abstract class _fetchDetails extends ConversationDetailEvent {
  const factory _fetchDetails(final String id) = _$_fetchDetails;
  const _fetchDetails._() : super._();

  String get id;
}

/// @nodoc

class _$_sendMessage extends _sendMessage {
  const _$_sendMessage(this.message) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'ConversationDetailEvent.sendMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_sendMessage &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) fetchDetails,
    required TResult Function(String message) sendMessage,
  }) {
    return sendMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? fetchDetails,
    TResult? Function(String message)? sendMessage,
  }) {
    return sendMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? fetchDetails,
    TResult Function(String message)? sendMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetchDetails value) fetchDetails,
    required TResult Function(_sendMessage value) sendMessage,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_fetchDetails value)? fetchDetails,
    TResult? Function(_sendMessage value)? sendMessage,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetchDetails value)? fetchDetails,
    TResult Function(_sendMessage value)? sendMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class _sendMessage extends ConversationDetailEvent {
  const factory _sendMessage(final String message) = _$_sendMessage;
  const _sendMessage._() : super._();

  String get message;
}

/// @nodoc
mixin _$ConversationDetailState {
  List<ConversationMessage> get messages => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ConversationMessage> messages) loading,
    required TResult Function(List<ConversationMessage> messages,
            bool isSending, String? lastMessage)
        initialized,
    required TResult Function(List<ConversationMessage> messages,
            String message, String? errorCode)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ConversationMessage> messages)? loading,
    TResult? Function(List<ConversationMessage> messages, bool isSending,
            String? lastMessage)?
        initialized,
    TResult? Function(List<ConversationMessage> messages, String message,
            String? errorCode)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages)? loading,
    TResult Function(List<ConversationMessage> messages, bool isSending,
            String? lastMessage)?
        initialized,
    TResult Function(List<ConversationMessage> messages, String message,
            String? errorCode)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loading value) loading,
    required TResult Function(_initialized value) initialized,
    required TResult Function(detailsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loading value)? loading,
    TResult? Function(_initialized value)? initialized,
    TResult? Function(detailsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loading value)? loading,
    TResult Function(_initialized value)? initialized,
    TResult Function(detailsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_loading extends _loading {
  const _$_loading({final List<ConversationMessage> messages = const []})
      : _messages = messages,
        super._();

  final List<ConversationMessage> _messages;
  @override
  @JsonKey()
  List<ConversationMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loading &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ConversationMessage> messages) loading,
    required TResult Function(List<ConversationMessage> messages,
            bool isSending, String? lastMessage)
        initialized,
    required TResult Function(List<ConversationMessage> messages,
            String message, String? errorCode)
        error,
  }) {
    return loading(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ConversationMessage> messages)? loading,
    TResult? Function(List<ConversationMessage> messages, bool isSending,
            String? lastMessage)?
        initialized,
    TResult? Function(List<ConversationMessage> messages, String message,
            String? errorCode)?
        error,
  }) {
    return loading?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages)? loading,
    TResult Function(List<ConversationMessage> messages, bool isSending,
            String? lastMessage)?
        initialized,
    TResult Function(List<ConversationMessage> messages, String message,
            String? errorCode)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loading value) loading,
    required TResult Function(_initialized value) initialized,
    required TResult Function(detailsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loading value)? loading,
    TResult? Function(_initialized value)? initialized,
    TResult? Function(detailsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loading value)? loading,
    TResult Function(_initialized value)? initialized,
    TResult Function(detailsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading extends ConversationDetailState {
  const factory _loading({final List<ConversationMessage> messages}) =
      _$_loading;
  const _loading._() : super._();

  @override
  List<ConversationMessage> get messages;
}

/// @nodoc

class _$_initialized extends _initialized {
  const _$_initialized(
      {required final List<ConversationMessage> messages,
      this.isSending = false,
      this.lastMessage})
      : _messages = messages,
        super._();

  final List<ConversationMessage> _messages;
  @override
  List<ConversationMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final bool isSending;
  @override
  final String? lastMessage;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_initialized &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.isSending, isSending) ||
                other.isSending == isSending) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_messages), isSending, lastMessage);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ConversationMessage> messages) loading,
    required TResult Function(List<ConversationMessage> messages,
            bool isSending, String? lastMessage)
        initialized,
    required TResult Function(List<ConversationMessage> messages,
            String message, String? errorCode)
        error,
  }) {
    return initialized(messages, isSending, lastMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ConversationMessage> messages)? loading,
    TResult? Function(List<ConversationMessage> messages, bool isSending,
            String? lastMessage)?
        initialized,
    TResult? Function(List<ConversationMessage> messages, String message,
            String? errorCode)?
        error,
  }) {
    return initialized?.call(messages, isSending, lastMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages)? loading,
    TResult Function(List<ConversationMessage> messages, bool isSending,
            String? lastMessage)?
        initialized,
    TResult Function(List<ConversationMessage> messages, String message,
            String? errorCode)?
        error,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(messages, isSending, lastMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loading value) loading,
    required TResult Function(_initialized value) initialized,
    required TResult Function(detailsError value) error,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loading value)? loading,
    TResult? Function(_initialized value)? initialized,
    TResult? Function(detailsError value)? error,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loading value)? loading,
    TResult Function(_initialized value)? initialized,
    TResult Function(detailsError value)? error,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized extends ConversationDetailState {
  const factory _initialized(
      {required final List<ConversationMessage> messages,
      final bool isSending,
      final String? lastMessage}) = _$_initialized;
  const _initialized._() : super._();

  @override
  List<ConversationMessage> get messages;
  bool get isSending;
  String? get lastMessage;
}

/// @nodoc

class _$detailsError extends detailsError {
  const _$detailsError(
      {required final List<ConversationMessage> messages,
      this.message = 'Error',
      this.errorCode})
      : _messages = messages,
        super._();

  final List<ConversationMessage> _messages;
  @override
  List<ConversationMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final String message;
  @override
  final String? errorCode;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$detailsError &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_messages), message, errorCode);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ConversationMessage> messages) loading,
    required TResult Function(List<ConversationMessage> messages,
            bool isSending, String? lastMessage)
        initialized,
    required TResult Function(List<ConversationMessage> messages,
            String message, String? errorCode)
        error,
  }) {
    return error(messages, message, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ConversationMessage> messages)? loading,
    TResult? Function(List<ConversationMessage> messages, bool isSending,
            String? lastMessage)?
        initialized,
    TResult? Function(List<ConversationMessage> messages, String message,
            String? errorCode)?
        error,
  }) {
    return error?.call(messages, message, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ConversationMessage> messages)? loading,
    TResult Function(List<ConversationMessage> messages, bool isSending,
            String? lastMessage)?
        initialized,
    TResult Function(List<ConversationMessage> messages, String message,
            String? errorCode)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(messages, message, errorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loading value) loading,
    required TResult Function(_initialized value) initialized,
    required TResult Function(detailsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loading value)? loading,
    TResult? Function(_initialized value)? initialized,
    TResult? Function(detailsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loading value)? loading,
    TResult Function(_initialized value)? initialized,
    TResult Function(detailsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class detailsError extends ConversationDetailState {
  const factory detailsError(
      {required final List<ConversationMessage> messages,
      final String message,
      final String? errorCode}) = _$detailsError;
  const detailsError._() : super._();

  @override
  List<ConversationMessage> get messages;
  String get message;
  String? get errorCode;
}
