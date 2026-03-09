import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_images.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.0,
        height: 96.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          image: DecorationImage(
            image: AssetImage(
              AppAssets.logo,
            ),
          ),
        ),
    );
  }
}
