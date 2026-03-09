import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/cubit/app_cubit.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/utills/text_styles.dart';

class ThemeRow extends StatelessWidget {
  const ThemeRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AppCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.settings,
            style: CustomTextStyles.poppins400styles18Black,
          ),
          SizedBox(height: 10.0),
          SwitchListTile(
            activeThumbColor: AppColor.secondColor,
            title: Text(
              'Dark Mode',
              style: CustomTextStyles.poppins400styles18Black,
            ),
            secondary: Image.asset(AppAssets.theme, width: 40.0, height: 40.0),
            value: cubit.isDark,
            onChanged: (value) {
              cubit.toggleTheme(value);
            },
          ),
        ],
      ),
    );
  }
}
