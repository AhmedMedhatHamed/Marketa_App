import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HeartButtonWidget extends StatelessWidget {
  const HeartButtonWidget({super.key, this.color, this.size, this.iconColor});

  final Color? color, iconColor;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: IconButton(
        onPressed: () {},
        icon: Icon(IconlyLight.heart, size: size, color: iconColor),
      ),
    );
  }
}
