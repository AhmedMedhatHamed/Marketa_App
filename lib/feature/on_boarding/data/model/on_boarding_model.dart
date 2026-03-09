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
      image: AppAssets.onBoarding1,
      title: 'Purchase Online !!',
      subTitle: 'Using our app’s history libraries\nyou can find many historical periods ',
  ),
  OnBoardingModel(
    image: AppAssets.onBoarding2,
    title: 'Track order !!',
    subTitle: 'A big variety of ancient places\nfrom all over the world',
  ),
  OnBoardingModel(
    image: AppAssets.onBoarding3,
    title: 'Get your order !!',
    subTitle: 'AI provide recommendations and helps\nyou to continue the search journey',
  ),
];