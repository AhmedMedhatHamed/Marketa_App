import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/cubit/app_cubit.dart';
import 'package:marketa/core/utills/app_color.dart';


class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = BlocProvider.of<AppCubit>(context);
    return BlocConsumer <AppCubit,AppState>(
      listener: (context,state){},
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: appCubit.pageController,
            children: appCubit.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: appCubit.currentIndex,
            onTap: appCubit.changeBottomNavBar,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColor.primaryColor,
            elevation: 0.0,
            items: appCubit.bottomNavigationBarItemList,
          ),
        );
      },
    );
  }
}