import 'package:flutter/material.dart';
import 'package:marketa/feature/home/data/models/category_model.dart';
import 'category_widget.dart';

class CategoryHome extends StatelessWidget {
  const CategoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      children: List.generate(categoryList.length, (index) {
        return CategoryWidget(
          image: categoryList[index].image,
          name: categoryList[index].name,
        );
      }),
    );
  }
}