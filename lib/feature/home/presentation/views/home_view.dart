import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/core/widgets/app_bar_leading.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/feature/home/presentation/widgets/category_home.dart';
import 'package:marketa/feature/home/presentation/widgets/home_banner_widget.dart';
import 'package:marketa/feature/home/presentation/widgets/latest_arrival_product.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: CustomAppBarText(text: AppStrings.appName),
            leading: AppBarLeading(),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 15.0)),
          SliverToBoxAdapter(child: HomeBannerWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 15.0)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                AppStrings.latestArrival,
                style: CustomTextStyles.poppinsBoldStyles18Black,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10.0)),
          SliverToBoxAdapter(child: LatestArrivalProduct()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                AppStrings.categories,
                style: CustomTextStyles.poppinsBoldStyles18Black,
              ),
            ),
          ),
          SliverToBoxAdapter(child: CategoryHome()),
        ],
      ),
    );
  }
}
