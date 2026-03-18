import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/core/widgets/empty_cart_bag.dart';
import 'package:marketa/feature/search/presentation/widgets/search_grid_view_widget.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyCartBag(
              image: AppAssets.bagWish,
              title: 'Your wishlist is empty!',
              subtitle:
                  'Looks like you didn\'t add anything yet to your wishlist\ngo ahead and start shopping now',
              buttonText: 'Shop Now',
              onPressed: () {},
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
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 15,
                        (context, index,)
                    {
                      return SearchGridViewWidget();
                    },
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    mainAxisExtent: 320,
                  ),
                ),
              ],
            ),
          );
  }
}
