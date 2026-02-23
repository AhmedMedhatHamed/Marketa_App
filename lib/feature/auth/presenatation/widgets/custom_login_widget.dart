import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/core/widgets/custom_button.dart';
import 'package:marketa/feature/auth/presenatation/widgets/custom_text_field.dart';

class CustomLoginWidget extends StatelessWidget {
  const CustomLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          CustomTextFormField(
            prefixIcon: Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            labelText: 'Email Address',
          ),
          SizedBox(height: 20.0),
          CustomTextFormField(
            prefixIcon: Icon(Icons.lock),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.go,
            obscureText: true,
            suffixIcon: Icon(CupertinoIcons.eye),
            labelText: 'Password',
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: (){
              context.go('/forgetPassword');
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                AppStrings.forgetPassword,
                style: CustomTextStyles.poppins300styles16.copyWith(
                  fontSize: 14.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          CustomButton(
            onPressed: (){},
            text: AppStrings.login,
          ),
          SizedBox(height: 15.0,),
          GestureDetector(
            onTap: (){
              context.go('/signUp');
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                '${AppStrings.register} Now',
                style: CustomTextStyles.poppins300styles16.copyWith(
                  fontSize: 14.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
