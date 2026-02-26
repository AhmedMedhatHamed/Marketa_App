import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketa/core/utills/app_color.dart';

void customToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 4,
    backgroundColor: AppColor.offWhite,
    textColor: Colors.black,
    fontSize: 16.0,
    fontAsset: 'Poppins',
  );
}
