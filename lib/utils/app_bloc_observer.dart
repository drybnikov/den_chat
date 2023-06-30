import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  factory AppBlocObserver.instance() => _singleton ??= AppBlocObserver._();
  static AppBlocObserver? _singleton;

  AppBlocObserver._();

  @override
  void onEvent(Bloc bloc, Object? event) {
    Fimber.d('bloc: ${bloc.runtimeType}, event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    Fimber.i('bloc: ${bloc.runtimeType}, change: $change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Fimber.e('bloc: ${bloc.runtimeType}', ex: error, stacktrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
