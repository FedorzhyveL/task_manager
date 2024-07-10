import 'dart:async';

import 'package:auto_route/auto_route.dart';
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
import 'package:task_manager/presentation/home_screen/bloc/home_bloc.dart';
import 'package:task_manager/presentation/navigation/app_router.dart';

final logger = Logger(
  printer: PrettyPrinter(),
  filter: null,
);

Future<void> main() async {
  Intl.defaultLocale = 'ru';
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await inject();
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
        debugShowCheckedModeBanner: false,
        color: const Color(0xFFF7F6F2),
        routerConfig: injector.get<AppRouter>().config(
          deepLinkBuilder: (deepLink) {
            logger.i(deepLink.path);
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
