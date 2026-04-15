import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/feature/auth/presenatation/cubit/auth_cubit.dart';

void _showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
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

void customShowSnackBar(BuildContext context, AuthErrorState state) {
  _showErrorSnackBar(context, state.errorMsg);
}

void customShowSnackBarTwo(BuildContext context, SignInErrorState state) {
  _showErrorSnackBar(context, state.errorMsg);
}