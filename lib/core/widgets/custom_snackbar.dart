import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/feature/auth/presenatation/cubit/auth_cubit.dart';

void customShowSnackBar(BuildContext context, AuthErrorState state) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.error_outline,color: Colors.white,),
          SizedBox(width: 3,),
          Center(
            child: Text(
              state.errorMsg,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.errorMsgColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        bottom: 5,
        left: 30,
        right: 30,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

void customShowSnackBarTwo(BuildContext context, SignInErrorState state) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.error_outline,color: Colors.white,),
          SizedBox(width: 3,),
          Center(
            child: Text(
              state.errorMsg,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.errorMsgColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        bottom: 5,
        left: 30,
        right: 30,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}