import 'package:flutter/material.dart';
import 'latest_arrival_product_widget.dart';

class LatestArrivalProduct extends StatelessWidget {
  const LatestArrivalProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.22,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: LatestArrivalProductWidget(),
          );
        },
      ),
    );
  }
}
