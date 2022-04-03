import 'package:flutter/material.dart';
import 'package:lunchtime_frontend/screens/login_screen.dart';
import 'package:lunchtime_frontend/screens/profile_screen.dart';
import 'package:lunchtime_frontend/screens/sign_up_screen.dart';
import 'package:lunchtime_frontend/utils/strings.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../custom_widgets/sliverappbar.dart';
import '../screens/adminpage.dart';
import '../screens/feedback_screen.dart';
import '../screens/forgot_password_screen.dart';
import '../screens/homescreen.dart';
import '../utils/after_scan_qr.dart';
import '../utils/build_qr_view.dart';
import '../utils/qr_scanner.dart';
import '../utils/strings.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
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
          builder: (_) => const SliverAppBarWidget(),
        );
      case StringApp.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
        );
      case StringApp.forgotRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case StringApp.qrScannerRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const QRScanner(),
        );
      case StringApp.adminRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AdminPage(),
        );

      case StringApp.qrScannerRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AfterScanResult(),
        );
      case StringApp.feedbackRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const FeedBackScreen(),
        );

      case StringApp.afterScanResultRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BuildQrView(
            result: args as Barcode,
            qrKey: args as GlobalKey,
            controller: args as QRViewController,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
    }
  }
}
