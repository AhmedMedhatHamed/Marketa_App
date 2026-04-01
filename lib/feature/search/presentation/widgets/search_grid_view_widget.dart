import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/core/widgets/heart_button_widget.dart';
import 'package:marketa/feature/product/presentation/view/product_details_view.dart';
import 'package:marketa/feature/search/presentation/cubit/search_cubit.dart';

class SearchGridViewWidget extends StatelessWidget {
  final int index;

  const SearchGridViewWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();
    final product = searchCubit.localProds[index];

    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailsView()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                product.productImage,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.22,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: Text(
                    product.productTitle,
                    style: CustomTextStyles.poppins400styles18Black,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Flexible(child: HeartButtonWidget()),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    '\$ ${product.productPrice}',
                    style: CustomTextStyles.poppins300styles16,
                  ),
                ),
                Flexible(
                  child: Material(
                    borderRadius: BorderRadius.circular(16.0),
                    color: AppColor.primaryColor,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16.0),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.shopping_cart,
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