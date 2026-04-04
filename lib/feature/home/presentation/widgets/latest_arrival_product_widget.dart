import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/core/widgets/heart_button_widget.dart';
import 'package:marketa/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:marketa/feature/product/data/models/product_model.dart';
import 'package:marketa/feature/product/presentation/view/product_details_view.dart';

class LatestArrivalProductWidget extends StatelessWidget {
  const LatestArrivalProductWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: GestureDetector(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductDetailsView(productId: product.productId);
              },
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                product.productImage,
                height: MediaQuery.of(context).size.width * 0.28,
                width: MediaQuery.of(context).size.width * 0.28,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                children: [
                  Text(
                    product.productTitle,
                    style: CustomTextStyles.poppins400styles18Black.copyWith(
                      fontSize: 16.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      HeartButtonWidget(size: 18.0, color: Colors.transparent),
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          final cartCubit = context.read<CartCubit>();
                          final isInCart = cartCubit.isProductInCart(
                            productId: product.productId,
                          );
                          return IconButton(
                            onPressed: () {
                              if (isInCart) return;
                              cartCubit.addProductToCart(
                                productId: product.productId,
                              );
                            },
                            icon: Icon(
                              isInCart
                                  ? CupertinoIcons.check_mark
                                  : CupertinoIcons.shopping_cart,
                              size: 18.0,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Text(
                    '${product.productPrice} \$',
                    style: CustomTextStyles.poppins300styles16.copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
