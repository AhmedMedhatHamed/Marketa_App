import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/text_styles.dart';

class AccountDetailsRow extends StatelessWidget {
  const AccountDetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.secondColor,
                width: 2,
              ),
              image: const DecorationImage(
                image: AssetImage(AppAssets.person),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmed Medhat',
                style: CustomTextStyles.poppinsBoldStyles18Black,
              ),
              Text(
                'Bodya7764@gmail.com',
                style: CustomTextStyles.poppins300styles16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}