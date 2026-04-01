import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/feature/search/data/models/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<SearchModel> localProds = [
    SearchModel(
      productId: 'iphone14-128gb-black',
      productTitle: "Apple iPhone 14 Pro (128GB) - Black",
      productPrice: "1399.99",
      productImage: "https://i.ibb.co/BtMBSgK/1-iphone14-128gb-black.webp",
    ),
    SearchModel(
      productId: 'iphone13-mini-256gb-midnight',
      productTitle: "iPhone 13 Mini, 256GB, Midnight - Unlocked",
      productPrice: "659.99",
      productImage: "https://i.ibb.co/nbwTvXQ/2-iphone13-mini-256gb-midnight.webp",
    ),
    SearchModel(
      productId: 'iphone14',
      productTitle: "iPhone 14",
      productPrice: "1199.99",
      productImage: "https://i.ibb.co/G7nXCW4/3-i-Phone-14.jpg",
    ),
    SearchModel(
      productId: 's22-ultra',
      productTitle: "Samsung Galaxy S22 Ultra 5G",
      productPrice: "1199.99",
      productImage: "https://i.ibb.co/z5zMDCx/4-Samsung-Galaxy-S22-Ultra-5-G-256-GB-Phantom-Black-Unlocked.webp",
    ),
    SearchModel(
      productId: 's21-ultra',
      productTitle: "Samsung Galaxy S21 Ultra 5G",
      productPrice: "1199.99",
      productImage: "https://i.ibb.co/ww5WjkV/5-Samsung-Galaxy-S21-Ultra-5-G.png",
    ),
    SearchModel(
      productId: 'oneplus-9-pro',
      productTitle: "OnePlus 9 Pro",
      productPrice: "1099.99",
      productImage: "https://i.ibb.co/0yhgKVv/6-One-Plus-9-Pro-5-G-LE2120-256-GB-12-GB-RAM.png",
    ),
    SearchModel(
      productId: 'z-flip3',
      productTitle: "Samsung Galaxy Z Flip3",
      productPrice: "999.99",
      productImage: "https://i.ibb.co/NstFstg/7-Samsung-Galaxy-Z-Flip3-5-G.png",
    ),
    SearchModel(
      productId: 'redmi-note10-pro',
      productTitle: "Xiaomi Redmi Note 10 Pro",
      productPrice: "249.99",
      productImage: "https://i.ibb.co/W3QcVMv/9-Xiaomi-Redmi-Note-10-Pro.png",
    ),
    SearchModel(
      productId: 'pixel-6',
      productTitle: "Google Pixel 6",
      productPrice: "799.99",
      productImage: "https://i.ibb.co/0K8ZxZj/11-Google-Pixel-6.png",
    ),
    SearchModel(
      productId: 'rog-g15',
      productTitle: "ASUS ROG Zephyrus G15",
      productPrice: "1599.99",
      productImage: "https://i.ibb.co/kMR5mpR/12-ASUS-ROG-Zephyrus-G15.png",
    ),
    SearchModel(
      productId: 'helios-300',
      productTitle: "Acer Predator Helios 300",
      productPrice: "1199.99",
      productImage: "https://i.ibb.co/tcB3HXJ/13-Acer-Predator-Helios-300.webp",
    ),
    SearchModel(
      productId: 'msi-gs66',
      productTitle: "MSI GS66 Stealth",
      productPrice: "1999.99",
      productImage: "https://i.ibb.co/0Q4xHVn/15-MSI-GS66-Stealth.png",
    ),
    SearchModel(
      productId: 'apple-watch-7',
      productTitle: "Apple Watch Series 7",
      productPrice: "399.99",
      productImage: "https://i.ibb.co/8cNwrbJ/16-Apple-Watch-Series-7.png",
    ),
    SearchModel(
      productId: 'galaxy-watch4',
      productTitle: "Samsung Galaxy Watch 4",
      productPrice: "249.99",
      productImage: "https://i.ibb.co/tsq0VD8/17-Samsung-Galaxy-Watch-4.png",
    ),
    SearchModel(
      productId: 'nike-air-force',
      productTitle: "Nike Air Force 1",
      productPrice: "90.88",
      productImage: "https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png",
    ),
    SearchModel(
      productId: 'ultraboost-21',
      productTitle: "Adidas Ultraboost 21",
      productPrice: "180.53",
      productImage: "https://i.ibb.co/QM1dLww/21-Adidas-Ultraboost-21.webp",
    ),
    SearchModel(
      productId: 'converse',
      productTitle: "Converse Chuck Taylor",
      productPrice: "55.12",
      productImage: "https://i.ibb.co/TBQv7G6/22-Converse-Chuck-Taylor-All-Star-High-Top.png",
    ),
    SearchModel(
      productId: 'vans-old-skool',
      productTitle: "Vans Old Skool",
      productPrice: "60.33",
      productImage: "https://i.ibb.co/NNDk3pt/24-Vans-Old-Skool.png",
    ),
  ];
}
