import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_color.dart';

import '../utills/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.height,
    this.color,
    this.radius,
    this.width,
  });

  final void Function()? onPressed;
  final String text;
  final double? height;
  final double? width;
  final Color? color;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ??AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(radius?? 8.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: CustomTextStyles.poppins400styles20),
      ),
    );
  }
}
