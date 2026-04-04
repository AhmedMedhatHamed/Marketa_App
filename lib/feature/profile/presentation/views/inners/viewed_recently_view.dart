import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/core/widgets/empty_cart_bag.dart';
import 'package:marketa/feature/product/presentation/cubit/product_cubit.dart';
import 'package:marketa/feature/profile/presentation/cubit/viewed_cubit/viewed_cubit.dart';
import 'package:marketa/feature/search/presentation/widgets/search_grid_view_widget.dart';

class ViewedRecentlyView extends StatelessWidget {
  const ViewedRecentlyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewedCubit, ViewedState>(
      builder: (context, state) {
        final productCubit = context.read<ProductCubit>();
        final viewedCubit = context.read<ViewedCubit>();
        final viewedProducts = viewedCubit.historyItems.values
            .map((e) => productCubit.findByProductId(e.productId))
            .whereType()
            .toList();

        return viewedProducts.isEmpty
            ? Scaffold(
          body: EmptyCartBag(
            image: AppAssets.bagWish,
            title: 'Your viewed recently is empty!',
            subtitle:
            'Looks like you didn\'t view anything yet\ngo ahead and start shopping now',
            buttonText: 'Shop Now',
            onPressed: () {},
          ),
        )
            : Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: CustomAppBarText(
                  text: AppStrings.viewedRecently,
                ),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: viewedProducts.length,
                      (context, index) {
                    return SearchGridViewWidget(
                      product: viewedProducts[index],
                    );
                  },
                ),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  mainAxisExtent: 320,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}