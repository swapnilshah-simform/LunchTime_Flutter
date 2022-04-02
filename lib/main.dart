import 'package:flutter/material.dart';
import 'package:lunchtime_frontend/utils/themes.dart';

import 'screens/adminpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      home: AdminPage(),
    );
  }
}
