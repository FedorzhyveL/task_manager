import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import 'package:task_manager/core/di.dart';
import 'package:task_manager/domain/use_cases/create_task_use_case.dart';
import 'package:task_manager/domain/use_cases/delete_task_use_caase.dart';
import 'package:task_manager/domain/use_cases/edit_task_use_case.dart';
import 'package:task_manager/domain/use_cases/get_task_use_case.dart';
import 'package:task_manager/domain/use_cases/get_tasks_use_case.dart';
import 'package:task_manager/domain/use_cases/update_tasks_use_case.dart';
import 'package:task_manager/firebase_options.dart';
import 'package:task_manager/presentation/home_screen/bloc/home_bloc.dart';
import 'package:task_manager/presentation/navigation/app_router.dart';
import 'package:task_manager/presentation/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';

final logger = Logger(
  printer: PrettyPrinter(),
  filter: null,
);

Future<void> main() async {
  Intl.defaultLocale = 'ru';
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FlutterError.onError = (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };

      await inject();
      injector.get<FirebaseAnalytics>().logEvent(name: 'app_started');
      runApp(const MainApp());
    },
    (error, stack) {},
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final HomeBloc _homeBloc;
  final stend = const String.fromEnvironment('STEND');
  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc(
      injector.get<GetTasksUseCase>(),
      injector.get<GetTaskUseCase>(),
      injector.get<UpdateTasksUseCase>(),
      injector.get<CreateTaskUseCase>(),
      injector.get<EditTaskUseCase>(),
      injector.get<DeleteTaskUseCase>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeBloc,
      child: MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: stend == 'TEST',
        theme: AppTheme().lightTheme,
        darkTheme: AppTheme().darkTheme,
        routerConfig: injector.get<AppRouter>().config(
          deepLinkBuilder: (deepLink) {
            logger.i(deepLink.path);
            injector.get<FirebaseAnalytics>().logEvent(
              name: 'deeplink_opened',
              parameters: {'path': deepLink.path},
            );
            if (deepLink.path.endsWith('/task')) {
              return DeepLink.single(TaskRoute());
            }
            return DeepLink.defaultPath;
          },
        ),
      ),
    );
  }
}
