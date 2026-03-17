import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/text_styles.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              'title'*15,
              style: CustomTextStyles.poppins400styles18Black,
            ),
          ),
          SizedBox(width: 14.0,),
          Text(
            '1025 \$',
            style: CustomTextStyles.poppinsBoldStyles18Black.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
