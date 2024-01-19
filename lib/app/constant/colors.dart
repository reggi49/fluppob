import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

const appPurple = Color(0xFF431AA1);
const appPurpleDark = Color(0xFF1E0771);
const appPurpleLight1 = Color(0xFF9345F2);
const appPurpleLight2 = Color(0xFFB9A2D8);
const appWhite = Color(0xFFFAF8FC);
const appOrange = Color(0xFFE6704A);
const appGrey = Color(0x00656572);

ThemeData themeLight = ThemeData(
  brightness: Brightness.light,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: appPurpleDark),
  primaryColor: appPurple,
  scaffoldBackgroundColor: appWhite,
  appBarTheme: AppBarTheme(
    elevation: 4,
    backgroundColor: appPurple,
  ), // AppBarTheme
  textTheme: TextTheme(
      bodyLarge: TextStyle(color: appPurpleDark),
      bodyMedium: TextStyle(color: appPurpleDark)),
  listTileTheme: ListTileThemeData(textColor: appPurpleDark), // TextTheme
  tabBarTheme: TabBarTheme(
    indicatorColor: appPurpleDark,
    labelColor: appPurpleDark,
    unselectedLabelColor: Colors.grey,
  ),
); // ThemeData
ThemeData themeDark = ThemeData(
  brightness: Brightness.dark,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: appWhite),
  primaryColor: appPurpleLight2,
  scaffoldBackgroundColor: appPurpleDark,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: appPurpleDark,
  ), // AppBarTheme
  textTheme: TextTheme(
      bodyLarge: TextStyle(color: appWhite),
      bodyMedium: TextStyle(color: appWhite)),
  listTileTheme: ListTileThemeData(textColor: appWhite), // TextTheme
  tabBarTheme: TabBarTheme(
    indicatorColor: appPurpleDark,
    labelColor: appWhite,
    unselectedLabelColor: Colors.grey,
  ),
); // ThemeData