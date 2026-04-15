import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/core/widgets/app_bar_leading.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/feature/home/presentation/widgets/category_home.dart';
import 'package:marketa/feature/home/presentation/widgets/home_banner_widget.dart';
import 'package:marketa/feature/home/presentation/widgets/latest_arrival_product.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: CustomAppBarText(text: AppStrings.appName),
            leading: AppBarLeading(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
          SliverToBoxAdapter(child: HomeBannerWidget()),
          const SliverToBoxAdapter(child: SizedBox(height: 15.0)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                AppStrings.latestArrival,
                style: CustomTextStyles.poppinsBoldStyles18Black,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
          const SliverToBoxAdapter(child: LatestArrivalProduct()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                AppStrings.categories,
                style: CustomTextStyles.poppinsBoldStyles18Black,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: CategoryHome()),
        ],
      ),
    );
  }
}