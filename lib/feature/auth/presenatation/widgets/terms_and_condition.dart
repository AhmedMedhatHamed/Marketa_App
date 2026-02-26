import 'package:flutter/material.dart';
import 'package:marketa/core/utills/text_styles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'I have agree to our ',
          style: CustomTextStyles.poppins300styles16.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
          ),
        ),
        Text(
          'Terms and Condition',
          style: CustomTextStyles.poppins300styles16.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
              decoration: TextDecoration.underline
          ),
        ),
      ],
    );
  }
}
