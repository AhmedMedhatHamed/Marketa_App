import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:marketa/core/utills/app_images.dart';

class HomeBannerWidget extends StatelessWidget {
  HomeBannerWidget({super.key});

  final List<String> bannerImage = [
    AppAssets.banner1,
    AppAssets.banner2,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.24,
      child: CardSwiper(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        cardsCount: bannerImage.length,
        cardBuilder: (context, index, percentThresholdX, percentThresholdY,) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              bannerImage[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}