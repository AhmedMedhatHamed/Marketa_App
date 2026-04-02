import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/core/widgets/empty_cart_bag.dart';
import 'package:marketa/feature/search/presentation/widgets/search_grid_view_widget.dart';

class ViewedRecentlyView extends StatelessWidget {
  const ViewedRecentlyView({super.key});

  final bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
      body: EmptyCartBag(
        image: AppAssets.bagWish,
        title: 'Your viewed recently is empty!',
        subtitle:
        'Looks like you didn\'t add anything yet to your viewed recently\ngo ahead and start shopping now',
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
              childCount: 15,
                  (context, index,)
              {
                return SearchGridViewWidget(productId: '',);
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
