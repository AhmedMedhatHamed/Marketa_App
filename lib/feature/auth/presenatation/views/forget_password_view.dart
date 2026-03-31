import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/feature/auth/presenatation/widgets/forget_pass_form.dart';
import 'package:marketa/feature/auth/presenatation/widgets/forgot_password_image.dart';
import 'package:marketa/feature/auth/presenatation/widgets/welcome_text.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              AppStrings.forgetPassword,
              style: CustomTextStyles.poppinsBoldStyles18Black,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 50.0)),
          SliverToBoxAdapter(child: ForgotImageWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 20.0)),
          SliverToBoxAdapter(
            child: WelcomeText(
              text1: AppStrings.forgetPassword,
              text2:
                  'Please enter the email address you would like your password reset information sent to',
            ),
          ),
          SliverToBoxAdapter(child:CustomForgetPasswordForm()),
        ],
      ),
    );
  }
}


