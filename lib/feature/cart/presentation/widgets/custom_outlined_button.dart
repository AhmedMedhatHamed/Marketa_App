import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/text_styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: BorderSide(
          width: 2,
          color: AppColor.greyColor,
        ),
      ),
      onPressed: onPressed,
      icon: Icon(IconlyLight.arrow_down_2),
      label: Text(
        text,
        style: CustomTextStyles.poppins300styles16,
      ),
    );
  }
}
