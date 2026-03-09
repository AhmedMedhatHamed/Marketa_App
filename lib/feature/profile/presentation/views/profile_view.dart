import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/core/widgets/custom_button.dart';
import 'package:marketa/core/widgets/custom_divider.dart';
import 'package:marketa/feature/profile/widgets/account_details_row.dart';
import 'package:marketa/feature/profile/widgets/general_column.dart';
import 'package:marketa/feature/profile/widgets/them_row.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Image.asset(AppAssets.shoppingCart, fit: BoxFit.fill),
        title: Text(
          AppStrings.appName,
          style: CustomTextStyles.poppins500styles24Black.copyWith(
            fontSize: 18.0,
          ),
        ),
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
