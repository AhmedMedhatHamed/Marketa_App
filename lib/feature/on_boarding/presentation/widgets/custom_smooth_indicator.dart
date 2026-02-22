import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothIndicator extends StatelessWidget {
   const CustomSmoothIndicator({super.key,required this.controller});
  final  PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: controller,
        count:  3,
        effect:  ExpandingDotsEffect(
          activeDotColor: AppColor.primaryColor,
          dotColor: AppColor.secondColor,
          dotHeight:7,
          dotWidth: 10,
        ),
    );
  }
}
