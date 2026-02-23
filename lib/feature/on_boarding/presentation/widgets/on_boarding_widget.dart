import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/feature/on_boarding/data/model/on_boarding_model.dart';
import 'package:marketa/feature/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'custom_smooth_indicator.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();

    return Expanded(
      child: PageView.builder(
        onPageChanged: cubit.changeIndex,
        controller: cubit.controller,
        itemCount: onBoardingList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Image.asset(
                  height: 250.0,
                  width: 300.0,
                  onBoardingList[index].image,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8.0),
                CustomSmoothIndicator(controller: cubit.controller),
                const SizedBox(height: 16.0),
                Text(
                  onBoardingList[index].title,
                  style: CustomTextStyles.poppins500styles24Black,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                Text(
                  onBoardingList[index].subTitle,
                  style: CustomTextStyles.poppins300styles16,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}