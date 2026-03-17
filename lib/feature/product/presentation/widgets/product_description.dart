import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/utills/text_styles.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.aboutThisItem,
                style: CustomTextStyles.poppinsBoldStyles18Black,
              ),
              Text(
                'In Phones',
                style: CustomTextStyles.poppins400styles18Black,
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'description'*20,
            style: CustomTextStyles.poppins300styles16,
          ),
        ],
      ),
    );
  }
}


