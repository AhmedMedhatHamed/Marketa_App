import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketa/core/utills/app_color.dart';

class AppStyle {
  final bool isDark;

  AppStyle(this.isDark);

  ThemeData get themeData => ThemeData(
    scaffoldBackgroundColor:
    isDark ? AppColor.darkScaffoldBackground : AppColor.lightScaffoldBackground,
    brightness: isDark ? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      systemOverlayStyle: isDark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
    ),
  );
}