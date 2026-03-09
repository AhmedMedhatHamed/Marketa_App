import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/utills/text_styles.dart';

class GeneralColumn extends StatelessWidget {
  const GeneralColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.general,
            style: CustomTextStyles.poppins400styles18Black,
          ),
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            title: Text(AppStrings.allOrder),
            leading: Image.asset(AppAssets.orderSvg, height: 40, width: 40),
            trailing: Icon(IconlyBold.arrow_right_2),
            onTap: () {},
          ),
          SizedBox(
            height: 5.0,
          ),
          ListTile(
            title: Text(AppStrings.wishlist),
            leading: Image.asset(AppAssets.wishlist, height: 40, width: 40),
            trailing: Icon(IconlyBold.arrow_right_2),
            onTap: () {},
          ),
          SizedBox(
            height: 5.0,
          ),
          ListTile(
            title: Text(AppStrings.viewedRecently),
            leading: Image.asset(AppAssets.recent, height: 40, width: 40),
            trailing: Icon(IconlyBold.arrow_right_2),
            onTap: () {},
          ),
          SizedBox(
            height: 5.0,
          ),
          ListTile(
            title: Text(AppStrings.address),
            leading: Image.asset(AppAssets.address, height: 40, width: 40),
            trailing: Icon(IconlyBold.arrow_right_2),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
