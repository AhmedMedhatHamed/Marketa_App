import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/widgets/custom_button.dart';

class FavoriteAndAddToCartWidget extends StatelessWidget {
  const FavoriteAndAddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Material(
            color: AppColor.secondColor,
            shape: CircleBorder(),
            child: IconButton(
              onPressed: () {},
              icon: Icon(IconlyLight.heart,),
            ),
          ),
          SizedBox(width: 10.0,),
          Expanded(
            child: CustomButtonWithIcon(
              onPressed: (){},
              text: 'Add to cart',
            ),
          )
        ],
      ),
    );
  }
}