import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/feature/cart/presentation/cubit/cart_cubit.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                if (index == 0)
                  Container(
                    height: 4,
                    width: 40,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColor.greyColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                InkWell(
                  onTap: () {
                    cartCubit.updateProductQuantity(
                      productId: productId,
                      quantity: index + 1,
                    );
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(20.0),
                  splashColor: AppColor.blueSplash,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${index + 1}',
                      style: CustomTextStyles.poppins400styles18Black,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}