import 'package:marketa/core/utills/app_images.dart';

class CategoryModel {
  final String image, name;

  CategoryModel({
    required this.image, required this.name,
  });
}

List<CategoryModel> categoryList = [
  CategoryModel(image: AppAssets.book, name: 'Book',),
  CategoryModel(image: AppAssets.cosmetics, name: 'Cosmetics',),
  CategoryModel(image: AppAssets.fashion, name: 'Fashion',),
  CategoryModel(image: AppAssets.mobiles, name: 'Mobiles',),
  CategoryModel(image: AppAssets.pc, name: 'PC',),
  CategoryModel(image: AppAssets.shoes, name: 'Shoes',),
  CategoryModel(image: AppAssets.electronics, name: 'Electronics',),
  CategoryModel(image: AppAssets.watch, name: 'Watch',),
];
