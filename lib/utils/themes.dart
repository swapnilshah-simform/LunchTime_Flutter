import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lunchtime_frontend/utils/palette.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Palette.primarySwatch,
      backgroundColor: Colors.black,
      textTheme: const TextTheme(
          headline1: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          subtitle2: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          caption: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          subtitle1: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 13,
          ),
          bodyText1: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 13,
          )),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          foregroundColor: Colors.red,
          titleTextStyle: TextStyle(
              fontSize: 22, color: Colors.teal, fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: Colors.grey),
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.blueGrey),
      buttonTheme: const ButtonThemeData(buttonColor: Colors.blueGrey),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      backgroundColor: Colors.black,
      textTheme: const TextTheme(
        headline1: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        button: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        caption: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        subtitle1: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: 13,
        ),
        bodyText1: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: 13,
        ),
        subtitle2: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black87,
          fontSize: 15,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          foregroundColor: Colors.blueGrey,
          titleTextStyle: TextStyle(
              fontSize: 22,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: Colors.blueGrey),
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        elevation: 0,
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.blueGrey),
      buttonTheme: const ButtonThemeData(buttonColor: Colors.blueGrey),
    );
  }
}
