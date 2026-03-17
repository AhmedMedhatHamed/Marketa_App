import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/feature/product/presentation/view/product_details_view.dart';

class LatestArrivalProductWidget extends StatelessWidget {
  const LatestArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: GestureDetector(
        onTap: () async{
         await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductDetailsView();
              },
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
                height: MediaQuery.of(context).size.width * 0.28,
                width: MediaQuery.of(context).size.width * 0.28,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'title ' * 5,
                    style: CustomTextStyles.poppins400styles18Black.copyWith(
                      fontSize: 16.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(IconlyLight.heart, size: 18.0),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_shopping_cart, size: 18.0),
                      ),
                    ],
                  ),

                  Text('1325 \$', style: CustomTextStyles.poppins300styles16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
