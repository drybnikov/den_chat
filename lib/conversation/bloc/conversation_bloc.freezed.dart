// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConversationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchLastConversations,
    required TResult Function(Conversation conversation) updateConversation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchLastConversations,
    TResult? Function(Conversation conversation)? updateConversation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchLastConversations,
    TResult Function(Conversation conversation)? updateConversation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetchConversations value) fetchLastConversations,
    required TResult Function(_updateConversation value) updateConversation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_fetchConversations value)? fetchLastConversations,
    TResult? Function(_updateConversation value)? updateConversation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetchConversations value)? fetchLastConversations,
    TResult Function(_updateConversation value)? updateConversation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_fetchConversations extends _fetchConversations {
  const _$_fetchConversations() : super._();

  @override
  String toString() {
    return 'ConversationEvent.fetchLastConversations()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_fetchConversations);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchLastConversations,
    required TResult Function(Conversation conversation) updateConversation,
  }) {
    return fetchLastConversations();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchLastConversations,
    TResult? Function(Conversation conversation)? updateConversation,
  }) {
    return fetchLastConversations?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchLastConversations,
    TResult Function(Conversation conversation)? updateConversation,
    required TResult orElse(),
  }) {
    if (fetchLastConversations != null) {
      return fetchLastConversations();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetchConversations value) fetchLastConversations,
    required TResult Function(_updateConversation value) updateConversation,
  }) {
    return fetchLastConversations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_fetchConversations value)? fetchLastConversations,
    TResult? Function(_updateConversation value)? updateConversation,
  }) {
    return fetchLastConversations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetchConversations value)? fetchLastConversations,
    TResult Function(_updateConversation value)? updateConversation,
    required TResult orElse(),
  }) {
    if (fetchLastConversations != null) {
      return fetchLastConversations(this);
    }
    return orElse();
  }
}

abstract class _fetchConversations extends ConversationEvent {
  const factory _fetchConversations() = _$_fetchConversations;
  const _fetchConversations._() : super._();
}

/// @nodoc

class _$_updateConversation extends _updateConversation {
  const _$_updateConversation(this.conversation) : super._();

  @override
  final Conversation conversation;

  @override
  String toString() {
    return 'ConversationEvent.updateConversation(conversation: $conversation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_updateConversation &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversation);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchLastConversations,
    required TResult Function(Conversation conversation) updateConversation,
  }) {
    return updateConversation(conversation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchLastConversations,
    TResult? Function(Conversation conversation)? updateConversation,
  }) {
    return updateConversation?.call(conversation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchLastConversations,
    TResult Function(Conversation conversation)? updateConversation,
    required TResult orElse(),
  }) {
    if (updateConversation != null) {
      return updateConversation(conversation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetchConversations value) fetchLastConversations,
    required TResult Function(_updateConversation value) updateConversation,
  }) {
    return updateConversation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_fetchConversations value)? fetchLastConversations,
    TResult? Function(_updateConversation value)? updateConversation,
  }) {
    return updateConversation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetchConversations value)? fetchLastConversations,
    TResult Function(_updateConversation value)? updateConversation,
    required TResult orElse(),
  }) {
    if (updateConversation != null) {
      return updateConversation(this);
    }
    return orElse();
  }
}

abstract class _updateConversation extends ConversationEvent {
  const factory _updateConversation(final Conversation conversation) =
      _$_updateConversation;
  const _updateConversation._() : super._();

  Conversation get conversation;
}

/// @nodoc
mixin _$ConversationState {
  List<Conversation> get conversations => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Conversation> conversations) loading,
    required TResult Function(List<Conversation> conversations) initialized,
    required TResult Function(
            List<Conversation> conversations, String message, String? errorCode)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Conversation> conversations)? loading,
    TResult? Function(List<Conversation> conversations)? initialized,
    TResult? Function(List<Conversation> conversations, String message,
            String? errorCode)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Conversation> conversations)? loading,
    TResult Function(List<Conversation> conversations)? initialized,
    TResult Function(List<Conversation> conversations, String message,
            String? errorCode)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loading value) loading,
    required TResult Function(_initialized value) initialized,
    required TResult Function(conversationsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loading value)? loading,
    TResult? Function(_initialized value)? initialized,
    TResult? Function(conversationsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loading value)? loading,
    TResult Function(_initialized value)? initialized,
    TResult Function(conversationsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_loading extends _loading {
  const _$_loading({final List<Conversation> conversations = const []})
      : _conversations = conversations,
        super._();

  final List<Conversation> _conversations;
  @override
  @JsonKey()
  List<Conversation> get conversations {
    if (_conversations is EqualUnmodifiableListView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversations);
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loading &&
            const DeepCollectionEquality()
                .equals(other._conversations, _conversations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_conversations));

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Conversation> conversations) loading,
    required TResult Function(List<Conversation> conversations) initialized,
    required TResult Function(
            List<Conversation> conversations, String message, String? errorCode)
        error,
  }) {
    return loading(conversations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Conversation> conversations)? loading,
    TResult? Function(List<Conversation> conversations)? initialized,
    TResult? Function(List<Conversation> conversations, String message,
            String? errorCode)?
        error,
  }) {
    return loading?.call(conversations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Conversation> conversations)? loading,
    TResult Function(List<Conversation> conversations)? initialized,
    TResult Function(List<Conversation> conversations, String message,
            String? errorCode)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(conversations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loading value) loading,
    required TResult Function(_initialized value) initialized,
    required TResult Function(conversationsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loading value)? loading,
    TResult? Function(_initialized value)? initialized,
    TResult? Function(conversationsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loading value)? loading,
    TResult Function(_initialized value)? initialized,
    TResult Function(conversationsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading extends ConversationState {
  const factory _loading({final List<Conversation> conversations}) = _$_loading;
  const _loading._() : super._();

  @override
  List<Conversation> get conversations;
}

/// @nodoc

class _$_initialized extends _initialized {
  const _$_initialized({required final List<Conversation> conversations})
      : _conversations = conversations,
        super._();

  final List<Conversation> _conversations;
  @override
  List<Conversation> get conversations {
    if (_conversations is EqualUnmodifiableListView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversations);
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_initialized &&
            const DeepCollectionEquality()
                .equals(other._conversations, _conversations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_conversations));

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Conversation> conversations) loading,
    required TResult Function(List<Conversation> conversations) initialized,
    required TResult Function(
            List<Conversation> conversations, String message, String? errorCode)
        error,
  }) {
    return initialized(conversations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Conversation> conversations)? loading,
    TResult? Function(List<Conversation> conversations)? initialized,
    TResult? Function(List<Conversation> conversations, String message,
            String? errorCode)?
        error,
  }) {
    return initialized?.call(conversations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Conversation> conversations)? loading,
    TResult Function(List<Conversation> conversations)? initialized,
    TResult Function(List<Conversation> conversations, String message,
            String? errorCode)?
        error,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(conversations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loading value) loading,
    required TResult Function(_initialized value) initialized,
    required TResult Function(conversationsError value) error,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loading value)? loading,
    TResult? Function(_initialized value)? initialized,
    TResult? Function(conversationsError value)? error,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loading value)? loading,
    TResult Function(_initialized value)? initialized,
    TResult Function(conversationsError value)? error,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized extends ConversationState {
  const factory _initialized(
      {required final List<Conversation> conversations}) = _$_initialized;
  const _initialized._() : super._();

  @override
  List<Conversation> get conversations;
}

/// @nodoc

class _$conversationsError extends conversationsError {
  const _$conversationsError(
      {required final List<Conversation> conversations,
      this.message = 'Error',
      this.errorCode})
      : _conversations = conversations,
        super._();

  final List<Conversation> _conversations;
  @override
  List<Conversation> get conversations {
    if (_conversations is EqualUnmodifiableListView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversations);
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
            other is _$conversationsError &&
            const DeepCollectionEquality()
                .equals(other._conversations, _conversations) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_conversations), message, errorCode);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Conversation> conversations) loading,
    required TResult Function(List<Conversation> conversations) initialized,
    required TResult Function(
            List<Conversation> conversations, String message, String? errorCode)
        error,
  }) {
    return error(conversations, message, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Conversation> conversations)? loading,
    TResult? Function(List<Conversation> conversations)? initialized,
    TResult? Function(List<Conversation> conversations, String message,
            String? errorCode)?
        error,
  }) {
    return error?.call(conversations, message, errorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Conversation> conversations)? loading,
    TResult Function(List<Conversation> conversations)? initialized,
    TResult Function(List<Conversation> conversations, String message,
            String? errorCode)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(conversations, message, errorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loading value) loading,
    required TResult Function(_initialized value) initialized,
    required TResult Function(conversationsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loading value)? loading,
    TResult? Function(_initialized value)? initialized,
    TResult? Function(conversationsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loading value)? loading,
    TResult Function(_initialized value)? initialized,
    TResult Function(conversationsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class conversationsError extends ConversationState {
  const factory conversationsError(
      {required final List<Conversation> conversations,
      final String message,
      final String? errorCode}) = _$conversationsError;
  const conversationsError._() : super._();

  @override
  List<Conversation> get conversations;
  String get message;
  String? get errorCode;
}
