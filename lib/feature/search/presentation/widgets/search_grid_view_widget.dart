import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/text_styles.dart';

class SearchGridViewWidget extends StatelessWidget {
  const SearchGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("TODO navigate to the product details screen");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.22,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: Text(
                    'Title' * 10,
                    style: CustomTextStyles.poppins400styles18Black,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(IconlyLight.heart),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    '1035 \$',
                    style: CustomTextStyles.poppins300styles16,
                  ),
                ),
                Flexible(
                  child: Material(
                    borderRadius: BorderRadius.circular(16.0),
                    color: AppColor.primaryColor,
                    child: InkWell(
                      splashColor: AppColor.secondColor,
                      borderRadius: BorderRadius.circular(16.0),
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add_shopping_cart_rounded,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
