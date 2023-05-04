import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../color/colors.dart';

class AppTheme {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? ThemeColors.lightTheme : ThemeColors.darkTheme;
  }
}

class ThemeColors {
  const ThemeColors._();
  static final lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
      ).copyWith(onPrimary: lightTextColor, onSecondary: blackColor),
      iconTheme: IconThemeData(color: lightIconColor),
      fontFamily: 'Poppins',
      primaryColor: primaryColor,
      backgroundColor: lightBackgroundColor,
      scaffoldBackgroundColor: lightBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: lightTextColor, fontSize: 22),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          // statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: lightBackgroundColor,
      ),
      textTheme: TextTheme(
        labelLarge: TextStyle(color: lightTextColor),
        displayLarge: TextStyle(color: lightTextColor),
        bodyLarge: TextStyle(color: lightTextColor),
        titleLarge: TextStyle(color: lightTextColor),
      ),
      // Bottom nav bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightBackgroundColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: lightTextColor,
        type: BottomNavigationBarType.fixed,
      ));

  static final darkTheme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
      ).copyWith(onPrimary: darkTextColor, onSecondary: whiteColor),
      iconTheme: IconThemeData(color: darkIconColor),
      fontFamily: 'Poppins',
      primaryColor: primaryColor,
      backgroundColor: darkBackgroundColor,
      scaffoldBackgroundColor: const Color(0xFF00040F),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        labelLarge: TextStyle(color: darkTextColor),
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: darkTextColor, fontSize: 22),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          // statusBarBrightness: Brightness.light,
        ),
        backgroundColor: darkBackgroundColor,
      ),
      // Bottom nav bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkBackgroundColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: darkTextColor,
        type: BottomNavigationBarType.fixed,
      ));
  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;
}

extension ThemeExtras on ThemeData {
  Color get navBarColor => brightness == Brightness.light
      ? Color.fromARGB(255, 177, 174, 174)
      : const Color(0xFF00040F);
  //
  Color get textColor => brightness == Brightness.light
      ? const Color(0xFF403930)
      : const Color(0xFFFFF8F2);
  //
  Color get secondaryColor => Color.fromARGB(255, 151, 83, 254);
  //
  Gradient get serviceCard =>
      brightness == Brightness.light ? grayWhite : grayBack;

  //
  Gradient get contactCard =>
      brightness == Brightness.light ? grayWhite : contactGradi;
}
