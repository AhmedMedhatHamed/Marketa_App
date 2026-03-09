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
            borderRadius: BorderRadiusGeometry.circular(radius?? 24.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: CustomTextStyles.poppins400styles20White),
      ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    this.onPressed,
    required this.text,
    this.height,
    this.color,
    this.radius,
    this.width,
    this.icon,
  });

  final void Function()? onPressed;
  final String text;
  final double? height;
  final double? width;
  final Color? color;
  final double? radius;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.0,
      child: ElevatedButton.icon(
        icon:icon,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ??AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(radius?? 24.0),
          ),
        ),
        onPressed: onPressed,
        label: Text(text, style: CustomTextStyles.poppins400styles20White),
      ),
    );
  }
}

