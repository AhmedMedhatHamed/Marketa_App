import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/cubit/app_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            AppCubit appCubit = BlocProvider.of<AppCubit>(context);
            return SwitchListTile(
              title: const Text(
                'Dark Mode',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              value: appCubit.isDark,
              onChanged: appCubit.toggleTheme,
            );
          },
        ),
      ),
    );
  }
}