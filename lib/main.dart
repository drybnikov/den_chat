import 'dart:async';

import 'package:den_chat/di/injection_container.dart';
import 'package:den_chat/home/root_navigator_widget.dart';
import 'package:den_chat/utils/app_bloc_observer.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      Fimber.plantTree(DebugTree());

      WidgetsFlutterBinding.ensureInitialized();

      configureDependencies();

      Bloc.observer = AppBlocObserver.instance();

      runApp(const MyApp());
    },
    (error, stack) {
      Fimber.e('App init error', ex: error, stacktrace: stack);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Den chat Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey, brightness: Brightness.dark),
      ),
      home: RootNavigatorWidget(),
    );
  }
}
