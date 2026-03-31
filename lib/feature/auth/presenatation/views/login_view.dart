import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/widgets/custom_divider.dart';
import 'package:marketa/feature/auth/presenatation/widgets/custom_header.dart';
import 'package:marketa/feature/auth/presenatation/widgets/custom_login_form.dart';
import 'package:marketa/feature/auth/presenatation/widgets/google_row_button.dart';
import 'package:marketa/feature/auth/presenatation/widgets/have_account_widget.dart';
import 'package:marketa/feature/auth/presenatation/widgets/or_connect_using_text.dart';
import 'package:marketa/feature/auth/presenatation/widgets/welcome_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CustomHeader()),
            SliverToBoxAdapter(
              child: WelcomeText(
                text1: AppStrings.welcomeBack,
                text2: AppStrings.loginDesc,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 15.0)),
            SliverToBoxAdapter(child: CustomLoginWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            SliverToBoxAdapter(
              child: HaveAccountWidget(
                onTap: () {
                  context.go('/signUp');
                },
                text1: AppStrings.haveAccount,
                text2: AppStrings.createAccount,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 15.0)),
            SliverToBoxAdapter(child: CustomDivider()),
            SliverToBoxAdapter(child: OrConnectUsingText()),
            SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            SliverToBoxAdapter(child: GoogleRowButtons()),
          ],
        ),
      ),
    );
  }
}


