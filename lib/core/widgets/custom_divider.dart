import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColor.greyColor,
      thickness: 1,
      endIndent: 25,
      indent: 25,
    );
  }
}
