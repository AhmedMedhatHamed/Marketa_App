import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/widgets/app_bar_leading.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/core/widgets/empty_cart_bag.dart';
import 'package:marketa/feature/cart/presentation/widgets/cart_bottom_sheet.dart';
import 'package:marketa/feature/cart/presentation/widgets/cart_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyCartBag(
              image: AppAssets.shoppingBasket,
              title: 'Your cart is empty!',
              subtitle:
                  'Looks like you didn\'t add anything yet to your cart\ngo ahead and start shopping now',
              buttonText: 'Shop Now',
              onPressed: () {},
            ),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: AppBarLeading(),
              title: CustomAppBarText(text: AppStrings.shoppingBasket),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(IconlyBold.delete, color: AppColor.errorMsgColor),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: 15,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CartWidget();
              },
            ),
            bottomSheet: CartBottomSheet(),
          );
  }
}
