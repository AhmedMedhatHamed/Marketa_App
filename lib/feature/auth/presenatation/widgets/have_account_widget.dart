import 'package:flutter/material.dart';
import 'package:marketa/core/utills/text_styles.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({super.key, required this.text1, required this.text2,required this.onTap,});

  final String text1,text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: CustomTextStyles.poppins300styles16.copyWith(
            fontSize: 14.0,
          ),
        ),
        SizedBox(width: 4.0,),
        GestureDetector(
          onTap:onTap,
          child: Text(
            text2,
            style: CustomTextStyles.poppinsStyles14Blue,
          ),
        ),
      ],
    );
  }
}
