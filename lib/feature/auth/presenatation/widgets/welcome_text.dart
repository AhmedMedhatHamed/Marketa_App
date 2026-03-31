import 'package:flutter/material.dart';
import 'package:marketa/core/utills/text_styles.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key, required this.text1, required this.text2});

  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: CustomTextStyles.poppinsBoldStyles26.copyWith(
              fontSize: 22.0,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            text2,
            style: CustomTextStyles.poppins300styles16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
