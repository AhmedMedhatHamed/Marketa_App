import 'package:marketa/core/utills/app_images.dart';

class OnBoardingModel {
  final String image, title, subTitle;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      image: AppImages.onBoarding1,
      title: 'title',
      subTitle: 'subTitle',
  ),
  OnBoardingModel(
    image: AppImages.onBoarding2,
    title: 'title',
    subTitle: 'subTitle',
  ),
  OnBoardingModel(
    image: AppImages.onBoarding3,
    title: 'title',
    subTitle: 'subTitle',
  ),
];