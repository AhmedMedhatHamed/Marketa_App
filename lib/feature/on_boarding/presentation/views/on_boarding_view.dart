import 'package:go_router/go_router.dart';
import 'package:marketa/feature/on_boarding/data/model/on_boarding_model.dart';
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
    return Scaffold(
      body: Column(
        children: [
          CustomOnboardingHeader(),
          OnBoardingWidget(),
          BlocBuilder<OnBoardingCubit, OnBoardingState>(
            builder: (context, state) {
              final cubit = context.read<OnBoardingCubit>();
              final isLastPage = cubit.currentIndex == onBoardingList.length - 1;
              return Padding(
                padding: const EdgeInsets.only(right: 20.0,left: 20.0,bottom: 10.0,),
                child: CustomButton(
                  text: isLastPage ? 'Login Now' : 'Next',
                  onPressed: () {
                    if (isLastPage) {
                      context.go('/loginView');
                    } else {
                      cubit.controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
