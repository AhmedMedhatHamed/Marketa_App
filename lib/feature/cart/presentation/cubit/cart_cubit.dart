import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/feature/cart/data/models/cart_model.dart';
import 'package:uuid/uuid.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final Map<String, CartModel> cartItems = {};

  Map<String, CartModel> get getCartItems {
    return cartItems;
  }

  bool isProductInCart({required String productId}){
    return cartItems.containsKey(productId);
  }

  Future<void> addProductToCart({required String productId}) async {
    cartItems.putIfAbsent(
      productId,
      () => CartModel(
        productId: productId,
        cartId: Uuid().v4(),
        quantity: 1,
      ),

    );
    emit(AddProductToCartState());
  }


}
