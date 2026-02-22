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
    color: Colors.white,
    fontFamily: 'Poppins',
  );
  static final poppins500styles24Black = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: 'Poppins',
  );
  static final poppinsBoldStyles26 = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Poppins',
  );
  static final poppinsStyles14 = TextStyle(
    fontSize: 14.0,
    color: Colors.white,
    fontFamily: 'Poppins',
  );
  static final poppins300styles16 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w300,
    color: Colors.grey,
    fontFamily: 'Poppins',
  );
}