import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketa/core/app_function/app_methods.dart';
import 'package:marketa/feature/profile/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:marketa/feature/profile/presentation/widgets/account_details_row.dart';
import 'package:marketa/feature/profile/presentation/widgets/general_column.dart';
import 'package:marketa/feature/profile/presentation/widgets/them_row.dart';
import 'package:marketa/core/widgets/app_bar_leading.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/core/widgets/custom_button.dart';
import 'package:marketa/core/widgets/custom_divider.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = FirebaseAuth.instance.currentUser != null;

    return BlocProvider(
      create: (context) => UserCubit()..displayUserInfo(),
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: CustomAppBarText(text: AppStrings.appName),
              leading: const AppBarLeading(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 15.0)),
            const SliverToBoxAdapter(child: AccountDetailsRow()),
            const SliverToBoxAdapter(child: CustomDivider()),
            const SliverToBoxAdapter(child: SizedBox(height: 15.0)),
            const SliverToBoxAdapter(child: GeneralColumn()),
            const SliverToBoxAdapter(child: CustomDivider()),
            const SliverToBoxAdapter(child: SizedBox(height: 15.0)),
            const SliverToBoxAdapter(child: ThemeRow()),
            const SliverToBoxAdapter(child: CustomDivider()),
            SliverToBoxAdapter(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: isLoggedIn
                    ? CustomButtonWithIcon(
                  onPressed: () {
                    AppMethods.errorAndWarningDialog(
                      context: context,
                      text: 'Are You Sure?',
                      isError: false,
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        context.go('/loginView');
                      },
                    );
                  },
                  text: AppStrings.logout,
                  color: AppColor.errorMsgColor,
                  icon: Icon(
                    IconlyLight.logout,
                    color: AppColor.offWhite,
                    size: 25.0,
                  ),
                )
                    : CustomButtonWithIcon(
                  onPressed: () {
                    context.go('/loginView');
                  },
                  text: AppStrings.login,
                  color: AppColor.errorMsgColor,
                  icon: Icon(
                    IconlyLight.login,
                    color: AppColor.offWhite,
                    size: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}