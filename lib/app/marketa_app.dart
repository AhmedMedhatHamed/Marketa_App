import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/cubit/app_cubit.dart';
import 'package:marketa/core/router/app_router.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/utills/app_style.dart';

class MarketaApp extends StatelessWidget {
  const MarketaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit appCubit = BlocProvider.of<AppCubit>(context);
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: AppStyle(appCubit.isDark).themeData,
          routerConfig: router,
        );
      },
    );
  }
}
