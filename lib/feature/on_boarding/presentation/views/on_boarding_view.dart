import 'package:marketa/feature/on_boarding/presentation/widgets/custom_onboarding_header.dart';
import 'package:marketa/feature/on_boarding/presentation/widgets/on_boarding_widget.dart';
import 'package:marketa/feature/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:marketa/core/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();
    return Scaffold(
      body: Column(
        children: [
          CustomOnboardingHeader(),
          OnBoardingWidget(

            controller: cubit.controller,
            onPageChanged: (index) {
              cubit.currentIndex = index;
            },
          ),
          CustomButton(
            text: 'Next',
            onPressed: () {
              cubit.controller.nextPage(
                duration: Duration(seconds: 1),
                curve: Curves.easeIn,
              );
            },
          ),
        ],
      ),
    );
  }
}
