import 'package:flutter/cupertino.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/widgets/custom_button.dart';
import 'package:marketa/core/widgets/heart_button_widget.dart';

class FavoriteAndAddToCartWidget extends StatelessWidget {
  const FavoriteAndAddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HeartButtonWidget(color: AppColor.secondColor),
          SizedBox(width: 10.0),
          Expanded(
            child: CustomButtonWithIcon(
              onPressed: () {},
              text: 'Add to cart',
              icon: Icon(
                CupertinoIcons.shopping_cart,
                color: AppColor.offWhite,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
