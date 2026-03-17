import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png',
      height: MediaQuery.of(context).size.height*0.38,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}