import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
            size: 35,
            color: Colors.deepPurpleAccent,
          ),
          unselectedIconTheme: IconThemeData(
            size: 20,
            color: Colors.black,
          )),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurpleAccent));
}
