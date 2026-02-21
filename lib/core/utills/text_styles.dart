import 'package:flutter/material.dart';
import 'app_color.dart';

abstract class CustomTextStyles{
  static final archivo400styles64 = TextStyle(
    fontSize: 64.0,
    fontWeight: FontWeight.w400,
    color: AppColor.primaryColor,
    fontFamily: 'Archivo',
  );
  static final poppins500styles24 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: 'Poppins',
  );
  static final poppins600styles12 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    color: Color(0xff6F6460),
    fontFamily: 'Poppins',
  );
  static final poppins300styles16 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontFamily: 'Poppins',
  );
}