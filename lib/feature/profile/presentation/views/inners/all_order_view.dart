import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/core/widgets/custom_divider.dart';
import 'package:marketa/core/widgets/empty_cart_bag.dart';
import 'package:marketa/feature/profile/presentation/widgets/all_order_widget.dart';

class AllOrderView extends StatelessWidget {
  const AllOrderView({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyCartBag(
              image: AppAssets.bagWish,
              title: 'Your orders is empty!',
              subtitle:
                  'Looks like you didn\'t add anything yet to your orders\ngo ahead and start shopping now',
              buttonText: 'Shop Now',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: CustomAppBarText(text: AppStrings.allOrder),
              surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            body: ListView.separated(
              itemCount: 15,
              separatorBuilder: (context, index) {
                return CustomDivider();
              },
              itemBuilder: (context, index) {
                return AllOrderWidget();
              },
            ),
          );
  }
}
