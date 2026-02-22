import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_color.dart';

import '../utills/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text});

  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          minimumSize: Size(double.infinity, 50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: CustomTextStyles.poppins500styles24),
      ),
    );
  }
}
