import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lunchtime_frontend/routes/route_generator.dart';
import 'package:lunchtime_frontend/screens/login_screen.dart';

import 'utils/strings.dart';
import 'utils/themes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  runApp(MaterialApp(
    onGenerateRoute: RouteGenerator.generateRoute,
    debugShowCheckedModeBanner: false,
    theme: CustomTheme.lightTheme,
    title: StringApp.materialAppButtonTitle,
    home: const LoginScreen(),
  ));
}
