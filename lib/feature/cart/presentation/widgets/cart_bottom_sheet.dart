import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/core/widgets/custom_button.dart';
import 'package:marketa/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:marketa/feature/product/presentation/cubit/product_cubit.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartCubit = context.read<CartCubit>();
        final productCubit = context.read<ProductCubit>();
        return Container(
          height: kBottomNavigationBarHeight + 10,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(
              top: BorderSide(color: AppColor.greyColor, width: 1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total (${cartCubit.getCartItems.length} Products/ ${cartCubit.getQuantity()} items)',
                        style: CustomTextStyles.poppins400styles18Black
                            .copyWith(fontSize: 15.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${cartCubit.getTotal(productCubit: productCubit)} \$',
                        style: CustomTextStyles.poppins300styles16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                CustomButton(
                  text: 'Checkout',
                  onPressed: () {},
                  width: 140.0,
                  height: 50.0,
                  color: AppColor.greyColor,
                  fontSize: 18.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}