import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

ThemeData darkTheme = ThemeData(
    accentColor: dColorAccent,
    primaryColor: dColorPrimary,
    cardColor: dColorCard,
    fontFamily: "Roboto",
    backgroundColor: dColorBackground,
    scaffoldBackgroundColor: dColorBackground,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: dTextMain,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 32,
      ),
      headline2: TextStyle(
        color: dTextMain,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: dTextMain,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 16,
      ),
    ),

    tabBarTheme: TabBarTheme(
      indicator: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          color: dColorAccent),
      unselectedLabelColor: colorGrey,
      labelColor: dColorPrimary,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 5.0,
      backgroundColor: dColorBackground,
      selectedItemColor: dColorAccent,
      selectedIconTheme: IconThemeData(color: dColorAccent),
      unselectedItemColor: colorGrey,
      unselectedIconTheme: IconThemeData(color: colorGrey),
      type: BottomNavigationBarType.fixed,
    ));

ThemeData lightTheme = ThemeData(
    accentColor: lColorAccent,
    primaryColor: lColorPrimary,
    cardColor: lColorCard,
    fontFamily: "Roboto",
    backgroundColor: lColorBackground,
    scaffoldBackgroundColor: lColorBackground,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: lTextMain,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 32,
      ),
      headline2: TextStyle(
        color: lTextMain,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: lTextMain,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 16,
      ),
    ),

    tabBarTheme: TabBarTheme(
      indicator: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          color: lColorAccent),
      unselectedLabelColor: colorGrey,
      labelColor: lColorPrimary,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 5.0,
      backgroundColor: lColorBackground,
      selectedItemColor: lColorAccent,
      selectedIconTheme: IconThemeData(color: lColorAccent),
      unselectedItemColor: colorGrey,
      unselectedIconTheme: IconThemeData(color: colorGrey),
      type: BottomNavigationBarType.fixed,
    ));