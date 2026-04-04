import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketa/core/utills/text_styles.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.image, required this.name});

  final String image, name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.push('/search', extra: name);
      },
      child: Column(
        children: [
          Image.asset(image, width: 50.0, height: 50.0),
          SizedBox(height: 5.0),
          Text(
            name,
            style: CustomTextStyles.poppinsBoldStyles18Black.copyWith(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
