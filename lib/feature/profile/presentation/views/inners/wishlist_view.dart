import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/core/widgets/empty_cart_bag.dart';
import 'package:marketa/feature/product/presentation/cubit/product_cubit.dart';
import 'package:marketa/feature/profile/presentation/cubit/wishlist_cubit.dart';
import 'package:marketa/feature/search/presentation/widgets/search_grid_view_widget.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        final productCubit = context.read<ProductCubit>();
        final wishlistCubit = context.read<WishlistCubit>();
        final wishlistProducts = wishlistCubit.wishlistItems.values
            .map((e) => productCubit.findByProductId(e.productId))
            .whereType()
            .toList();

        return wishlistProducts.isEmpty
            ? Scaffold(
          body: EmptyCartBag(
            image: AppAssets.bagWish,
            title: 'Your wishlist is empty!',
            subtitle:
            'Looks like you didn\'t add anything yet to your wishlist\ngo ahead and start shopping now',
            buttonText: 'Shop Now',
            onPressed: () => context.push('/root'),
          ),
        )
            : Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: CustomAppBarText(
                  text: AppStrings.wishlist,
                  fontSize: 22.0,
                ),
                actions: [
                  IconButton(
                    onPressed: () => wishlistCubit.clearAllWishlist(),
                    icon: Icon(
                      IconlyBold.delete,
                      color: AppColor.errorMsgColor,
                    ),
                  ),
                ],
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: wishlistProducts.length,
                      (context, index) {
                    return SearchGridViewWidget(
                      product: wishlistProducts[index],
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