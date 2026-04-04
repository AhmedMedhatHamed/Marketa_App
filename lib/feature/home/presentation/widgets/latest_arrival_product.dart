import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/feature/product/presentation/cubit/product_cubit.dart';

import 'latest_arrival_product_widget.dart';

class LatestArrivalProduct extends StatelessWidget {
  const LatestArrivalProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final productCubit = context.read<ProductCubit>();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.22,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productCubit.localProds.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LatestArrivalProductWidget(
              product: productCubit.localProds[index],
            ),
          );
        },
      ),
    );
  }
}