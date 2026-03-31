import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/widgets/custom_button.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButtonWithIcon(
      text: 'Login With Google',
      textColor: Colors.black,
      icon: Icon(Ionicons.logo_google, color: AppColor.errorMsgColor),
      fontSize: 18.0,
      width: 230.0,
      color: AppColor.offWhite,
      onPressed: () async {},
    );
  }
}
