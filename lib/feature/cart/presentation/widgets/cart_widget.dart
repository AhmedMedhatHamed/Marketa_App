import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/feature/cart/presentation/widgets/custom_outlined_button.dart';
import 'package:marketa/feature/cart/presentation/widgets/quantity_widget.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              const SizedBox(width: 10.0),
              IntrinsicWidth(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text('Title' * 10, maxLines: 2),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.clear, color: Colors.red),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(IconlyLight.heart, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "16\$",
                          style: CustomTextStyles.poppins300styles16,
                        ),
                        CustomOutlinedButton(
                          text: 'Qty: 1',
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Theme.of(
                                context,
                              ).scaffoldBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.only(
                                  topRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return QuantityWidget();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
