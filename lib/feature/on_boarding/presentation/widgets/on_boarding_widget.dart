import 'package:flutter/material.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/feature/on_boarding/data/model/on_boarding_model.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        //onPageChanged: onPageChanged,
        //controller: controller,
        itemCount: onBoardingList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 290.0,
                width: 343.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(onBoardingList[index].image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
             // CustomSmoothIndicator(controller: controller),
              const SizedBox(height: 32.0),
              Text(
                onBoardingList[index].title,
                style: CustomTextStyles.poppins500styles24,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 16.0),
              Text(
                onBoardingList[index].subTitle,
                style: CustomTextStyles.poppins300styles16,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          );
        },
      ),
    );
  }
}
