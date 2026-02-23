import 'package:flutter/material.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/feature/auth/presenatation/widgets/custom_header.dart';
import 'package:marketa/feature/auth/presenatation/widgets/custom_login_widget.dart';

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
            SliverToBoxAdapter(child: CustomHeader(pageName: AppStrings.login)),
            SliverToBoxAdapter(child: SizedBox(height: 40.0)),
            SliverToBoxAdapter(child: CustomLoginWidget()),
          ],
        ),
      ),
    );
  }
}
