import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/app_strings.dart';
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
          top: 50.0,
          right: 24.0,
          child: InkWell(
            onTap: (){
              context.go('/loginView');
            },
            child: Text(
              AppStrings.skip,
              style: CustomTextStyles.poppinsStyles14.copyWith(fontSize: 18.0,),
            ),
          ),
        ),
        Positioned(
          top: 100.0,
          left: 24.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Image.asset(
                AppImages.onBoardingIcon,
                height:42.0,
                width: 55.0,
              ),
              SizedBox(height: 16.0),
              Text(
                '${AppStrings.appName} Shop',
                style: CustomTextStyles.poppinsBoldStyles26,
              ),
              SizedBox(height: 8.0),
              Text(
                  AppStrings.appDescription,
                  style: CustomTextStyles.poppinsStyles14
              ),
            ],
          ),
        )
      ],
    );
  }
}
