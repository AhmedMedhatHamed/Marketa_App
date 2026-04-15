import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/widgets/custom_button.dart';
import 'google_button.dart';

class GoogleRowButtons extends StatelessWidget {
  const GoogleRowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: GoogleButton()),
          SizedBox(width: 10.0),
          CustomButton(
            text: 'Guest',
            fontSize: 18.0,
            onPressed: () async{
              await context.push('/root');
            },
            color: AppColor.primaryColor,
            width: 102.0,
          ),
        ],
      ),
    );
  }
}