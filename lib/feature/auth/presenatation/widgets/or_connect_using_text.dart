import 'package:flutter/material.dart';
import 'package:marketa/core/utills/text_styles.dart';

class OrConnectUsingText extends StatelessWidget {
  const OrConnectUsingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'or connect using'.toUpperCase(),
        style: CustomTextStyles.poppins300styles16,
      ),
    );
  }
}