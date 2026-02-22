import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  final PageController controller = PageController();
  int currentIndex = 0;


}
