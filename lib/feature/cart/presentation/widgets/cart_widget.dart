import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/core/widgets/heart_button_widget.dart';
import 'package:marketa/feature/cart/data/models/cart_model.dart';
import 'package:marketa/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:marketa/feature/cart/presentation/widgets/quantity_widget.dart';
import 'package:marketa/feature/product/data/models/product_model.dart';
import 'package:marketa/feature/product/presentation/view/product_details_view.dart';

import 'custom_outlined_button.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key, required this.product, required this.cartModel});

  final ProductModel product;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsView(
                            productId: product.productId,
                          );
                        },
                      ),
                    );
                  },
                  child: Image.network(
                    product.productImage,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              IntrinsicWidth(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(product.productTitle, maxLines: 2),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                cartCubit.removeProduct(productId: product.productId);
                              },
                              icon: Icon(
                                Icons.clear,
                                color: AppColor.errorMsgColor,
                              ),
                            ),
                            HeartButtonWidget(
                              iconColor: AppColor.errorMsgColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${product.productPrice}',
                          style: CustomTextStyles.poppins300styles16,
                        ),
                        CustomOutlinedButton(
                          text: 'Qty: ${cartModel.quantity}',
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Theme.of(
                                context,
                              ).scaffoldBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.only(
                                  topRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return QuantityWidget(
                                  productId: cartModel.productId,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
