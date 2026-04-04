import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/widgets/app_bar_leading.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/core/widgets/empty_cart_bag.dart';
import 'package:marketa/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:marketa/feature/cart/presentation/widgets/cart_bottom_sheet.dart';
import 'package:marketa/feature/cart/presentation/widgets/cart_widget.dart';
import 'package:marketa/feature/product/presentation/cubit/product_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    return cartCubit.getCartItems.isEmpty
        ? Scaffold(
            body: EmptyCartBag(
              image: AppAssets.shoppingBasket,
              title: 'Your cart is empty!',
              subtitle:
                  'Looks like you didn\'t add anything yet to your cart\ngo ahead and start shopping now',
              buttonText: 'Shop Now',
              onPressed: () {
                context.push('/root');
              },
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
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartCubit = context.read<CartCubit>();
          final cartList = cartCubit.getCartItems.values.toList();
          return ListView.builder(
            itemCount: cartList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final cartModel = cartList[index];
              final product = context.read<ProductCubit>().findByProductId(cartModel.productId);
              if (product == null) return const SizedBox.shrink();
              return CartWidget(
                product: product,
                cartModel: cartModel,
              );
            },
          );
        },
      ),
            bottomSheet: CartBottomSheet(),
          );
  }
}
