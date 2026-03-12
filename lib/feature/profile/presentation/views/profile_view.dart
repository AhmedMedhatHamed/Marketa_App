import 'package:marketa/core/widgets/app_bar_leading.dart';
import 'package:marketa/core/widgets/custom_app_bar_text.dart';
import 'package:marketa/feature/profile/widgets/account_details_row.dart';
import 'package:marketa/feature/profile/widgets/general_column.dart';
import 'package:marketa/feature/profile/widgets/them_row.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: AppBarLeading(),
        title: CustomAppBarText(text: AppStrings.appName),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 15.0)),
          SliverToBoxAdapter(child: AccountDetailsRow()),
          SliverToBoxAdapter(child: CustomDivider()),
          SliverToBoxAdapter(child: SizedBox(height: 15.0)),
          SliverToBoxAdapter(child: GeneralColumn()),
          SliverToBoxAdapter(child: CustomDivider()),
          SliverToBoxAdapter(child: SizedBox(height: 15.0)),
          SliverToBoxAdapter(child: ThemeRow()),
          SliverToBoxAdapter(child: CustomDivider()),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButtonWithIcon(
                onPressed: () {},
                text: AppStrings.logout,
                color: AppColor.errorMsgColor,
                icon: Icon(
                  IconlyLight.logout,
                  color: AppColor.offWhite,
                  size: 25.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
