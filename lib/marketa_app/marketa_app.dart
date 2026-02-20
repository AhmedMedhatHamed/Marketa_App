import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/cubit/app_cubit.dart';
import 'package:marketa/core/utills/cache_helper.dart';
import 'package:marketa/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(
    BlocProvider(
      create: (context) => AppCubit(),
      child: const MarketaApp(),
    ),
  );
}