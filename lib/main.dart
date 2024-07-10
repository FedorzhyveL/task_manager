import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import 'package:task_manager/core/di.dart';
import 'package:task_manager/presentation/home_screen/home_screen.dart';

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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      color: Color(0xFFF7F6F2),
      home: HomeScreen(),
    );
  }
}
