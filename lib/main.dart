import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/utills/app_style.dart';
import 'package:marketa/feature/home/presentation/home_view.dart';
import 'core/cubit/app_cubit.dart';

class MarketaApp extends StatelessWidget {
  const MarketaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final cubit = context.read<AppCubit>();

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Marketa',
          theme: AppStyle(cubit.isDark).themeData,
          home: const HomeView(),
        );
      },
    );
  }
}
