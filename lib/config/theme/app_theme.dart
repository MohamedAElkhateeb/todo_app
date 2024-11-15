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
      selectedIconTheme: IconThemeData(size: 24),
      unselectedIconTheme: IconThemeData(size: 24),
    ),
  );
  static ThemeData dark = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsManger.blue,
        primary: ColorsManger.darkScaffoldBg,
        onPrimary: ColorsManger.darkGrey,
      ),
      scaffoldBackgroundColor: ColorsManger.darkScaffoldBg,
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: ColorsManger.blue,
        titleTextStyle: DarkAppStyle.appBar,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        unselectedItemColor: ColorsManger.white,
        selectedItemColor: ColorsManger.blue,
        selectedIconTheme: IconThemeData(size: 22),
        unselectedIconTheme: IconThemeData(size: 22),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
          shape: CircularNotchedRectangle(), color: ColorsManger.darkGrey),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ColorsManger.blue,
          iconSize: 28,
          shape: StadiumBorder(
            side: BorderSide(
              color: ColorsManger.darkGrey,
              width: 4,
            ),
          )),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: ColorsManger.darkGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
      ));
}
