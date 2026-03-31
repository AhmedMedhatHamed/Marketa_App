import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_images.dart';

class ForgotImageWidget extends StatelessWidget {
  const ForgotImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Image.asset(
        AppAssets.forgotPassword,
        width: double.infinity,
        height: 250.0,
        fit: BoxFit.cover,
      ),
    );
  }
}