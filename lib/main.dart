import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/marketa_app.dart';
import 'core/cubit/app_cubit.dart';
import 'core/utills/cache_helper.dart';


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

