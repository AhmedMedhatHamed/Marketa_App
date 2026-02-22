import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_consts.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/feature/on_boarding/presentation/widgets/custom_header_clipper.dart';

class CustomOnboardingHeader extends StatelessWidget {
  const CustomOnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        ClipPath(
          clipper: CustomHeaderClipper(),
          child: Container(
            height: 350.0,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff1E88E5),
                  Color(0xff1565C0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),

        Positioned(
          top: 100,
          left: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Image.asset(
                'assets/images/Users/on_boarding_icon.png',
                height:42.0,
                width: 55.0,
              ),
              SizedBox(height: 16.0),
              Text(
                '${AppConsts.appName} Shop',
                style: CustomTextStyles.poppinsBoldStyles26,
              ),
              SizedBox(height: 8.0),
              Text(
                  "Professional App for your\n"
                      "eCommerce business",
                  style: CustomTextStyles.poppinsStyles14
              ),
            ],
          ),
        )
      ],
    );
  }
}
