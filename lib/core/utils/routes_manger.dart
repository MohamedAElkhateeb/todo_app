import 'package:flutter/material.dart';
import 'package:todo_app/presentation/auth/login/login_screen.dart';
import 'package:todo_app/presentation/auth/register/register_screen.dart';
import 'package:todo_app/presentation/screens/home/home_screen.dart';
import 'package:todo_app/presentation/screens/splash/splash_screen.dart';

class RoutesManger {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String register = '/register';
  static const String login = '/login';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case register:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => Login(),
        );
      case splash:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
    }
  }
}
