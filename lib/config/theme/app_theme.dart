import 'package:flutter/material.dart';
import 'package:todo_app/config/theme/app_styles.dart';
import 'package:todo_app/core/utils/colors_manger.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorsManger.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            12,
          ),
      topLeft: Radius.circular(12),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManger.blue,
      primary: ColorsManger.blue,
      onPrimary: ColorsManger.white,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(

        shape: CircularNotchedRectangle()),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: StadiumBorder(
        side: BorderSide(width: 4, color: ColorsManger.white),
      ),
      iconSize: 24,
      backgroundColor: ColorsManger.blue,
      foregroundColor: ColorsManger.white,
    ),
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: ColorsManger.blue,
      titleTextStyle: LightAppStyle.appBar,
    ),
    scaffoldBackgroundColor: ColorsManger.greenAccent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: ColorsManger.blue,
      unselectedItemColor: ColorsManger.gray,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(size: 33),
      unselectedIconTheme: IconThemeData(size: 33),
    ),
  );
  static ThemeData dark = ThemeData();
}
