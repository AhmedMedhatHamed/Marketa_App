import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_color.dart';

class AppStyle {
  final bool isDark;

  AppStyle(this.isDark);

  ThemeData get themeData => ThemeData(
    scaffoldBackgroundColor:
    isDark ? AppColor.darkScaffoldBackground : AppColor.lightScaffoldBackground,
    brightness: isDark ? Brightness.dark : Brightness.light,
  );
}