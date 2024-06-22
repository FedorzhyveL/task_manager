import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/presentation/home_screen/home_screen.dart';

void main() {
  Intl.defaultLocale = 'ru';
  runZonedGuarded(
    () => runApp(const MainApp()),
    (error, stack) {},
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('ru')],
      debugShowCheckedModeBanner: false,
      color: Color(0xFFF7F6F2),
      home: HomeScreen(),
    );
  }
}
