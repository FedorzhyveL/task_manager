import 'package:flutter/material.dart';
import 'package:task_manager/presentation/utils/palette.dart';
import 'package:task_manager/presentation/utils/text_styles.dart';

class AppTheme {
  final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: LightPalette.backPrimary,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightPalette.backPrimary,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: LightPalette.blue,
      foregroundColor: LightPalette.white,
      shape: CircleBorder(),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all<TextStyle>(TextStyles.button),
        foregroundColor: WidgetStateProperty.all<Color>(LightPalette.blue),
      ),
    ),
    cardColor: LightPalette.backSecondary,
    dividerColor: LightPalette.supportSeparator,
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return LightPalette.blue;
          }
          return LightPalette.backElevated;
        },
      ),
      trackColor: WidgetStateProperty.resolveWith<Color?>(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return LightPalette.darkBlue;
          }
          return null;
        },
      ),
      trackOutlineColor: const WidgetStatePropertyAll(
        LightPalette.supportSeparator,
      ),
    ),
    datePickerTheme: const DatePickerThemeData(
      headerBackgroundColor: LightPalette.blue,
      surfaceTintColor: LightPalette.blue,
      todayForegroundColor: WidgetStatePropertyAll(LightPalette.blue),
      rangeSelectionBackgroundColor: LightPalette.blue,
      rangeSelectionOverlayColor: WidgetStatePropertyAll(LightPalette.blue),
      rangePickerBackgroundColor: LightPalette.blue,
      dayOverlayColor: WidgetStatePropertyAll(LightPalette.blue),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return LightPalette.green;
          }
          return null;
        },
      ),
    ),
  );

  final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkPalette.backPrimary,
    ),
    scaffoldBackgroundColor: DarkPalette.backPrimary,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: DarkPalette.blue,
      foregroundColor: DarkPalette.white,
    ),
    brightness: Brightness.dark,
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return DarkPalette.green;
          }
          return null;
        },
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all<TextStyle>(TextStyles.button),
        foregroundColor: WidgetStateProperty.all<Color>(DarkPalette.blue),
      ),
    ),
    cardColor: DarkPalette.backSecondary,
    dividerColor: DarkPalette.supportSeparator,
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return DarkPalette.blue;
          }
          return DarkPalette.backElevated;
        },
      ),
      trackColor: WidgetStateProperty.resolveWith<Color?>(
        (state) {
          if (state.contains(WidgetState.selected)) {
            return DarkPalette.darkBlue;
          }
          return DarkPalette.supportOverlay;
        },
      ),
      trackOutlineColor: const WidgetStatePropertyAll(
        DarkPalette.supportSeparator,
      ),
    ),
    datePickerTheme: const DatePickerThemeData(
      headerBackgroundColor: DarkPalette.blue,
      surfaceTintColor: DarkPalette.blue,
      todayForegroundColor: WidgetStatePropertyAll(DarkPalette.blue),
      rangeSelectionBackgroundColor: DarkPalette.blue,
      rangeSelectionOverlayColor: WidgetStatePropertyAll(DarkPalette.blue),
      rangePickerBackgroundColor: DarkPalette.blue,
      dayOverlayColor: WidgetStatePropertyAll(DarkPalette.blue),
    ),
  );
}
