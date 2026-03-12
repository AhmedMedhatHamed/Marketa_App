import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/text_styles.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            if (index == 0)
              Container(
                height: 4,
                width: 40,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.greyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

            InkWell(
              onTap: (){},
              borderRadius: BorderRadius.circular(20.0),
              splashColor:AppColor.blueSplash,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${index + 1}',
                  style: CustomTextStyles.poppins400styles18Black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}