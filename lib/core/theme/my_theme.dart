import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: Color(0xFF823F8D),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: Color(0xFF823F8D),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white30,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Color(0xFF823F8D),
      ));
  static ThemeData darkTheme = ThemeData(
      primaryColor: Color(0xFF4851E5),
      canvasColor: Colors.black,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: Color(0xFF4851E5),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFF4851E5),
        unselectedItemColor: Colors.white30,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black,
      ));
}
