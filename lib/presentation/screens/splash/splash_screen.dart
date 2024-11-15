import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/assets_manger.dart';
import 'package:todo_app/core/utils/routes_manger.dart';

import '../../../providers/theme_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);

    Future.delayed(
      Duration(seconds: 3),
          () {
        Navigator.pushReplacementNamed(context, RoutesManger.home);
      },
    );
    return Container(
      child: Image.asset(
        themeProvider.currentTheme==ThemeMode.light
            ? AssetsManager.lightSplash
            : AssetsManager.darkSplash,
       fit: BoxFit.fill,
      ),
    );
  }
}
