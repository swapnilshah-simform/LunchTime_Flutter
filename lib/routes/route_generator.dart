import 'package:flutter/material.dart';
import 'package:lunchtime_frontend/screens/login_screen.dart';
import 'package:lunchtime_frontend/screens/profile_screen.dart';
import 'package:lunchtime_frontend/screens/sign_up_screen.dart';
import 'package:lunchtime_frontend/utils/strings.dart';

import '../screens/homescreen.dart';
import '../utils/strings.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StringApp.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case StringApp.signUpRoute:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case StringApp.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case StringApp.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
    }
  }
}