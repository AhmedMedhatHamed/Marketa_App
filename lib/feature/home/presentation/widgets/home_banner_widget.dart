import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_color.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(20.0),
          child: Swiper(
            autoplay: true,
            itemBuilder: (BuildContext context,int index){
              return Image.asset(
                bannerImage[index],
                fit: BoxFit.cover,
              );
            },
            itemCount: bannerImage.length,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: AppColor.greyColor,
                activeColor: AppColor.secondColor,
              )
            ),
          ),
        ),
      ),
    );
  }
}