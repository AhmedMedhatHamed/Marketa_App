import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/feature/product/presentation/widgets/favorite_and_add_to_cart.dart';
import 'package:marketa/feature/product/presentation/widgets/product_description.dart';
import 'package:marketa/feature/product/presentation/widgets/product_image.dart';
import 'package:marketa/feature/product/presentation/widgets/title_and_price.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: CustomAppBarText(text: AppStrings.appName),
          ),
          SliverToBoxAdapter(child: ProductImage()),
          SliverToBoxAdapter(child: SizedBox(height: 25.0)),
          SliverToBoxAdapter(child: TitleAndPrice()),
          SliverToBoxAdapter(child: SizedBox(height: 25.0)),
          SliverToBoxAdapter(child: FavoriteAndAddToCartWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 25.0)),
          SliverToBoxAdapter(child: ProductDescription()),
        ],
      ),
    );
  }
}


