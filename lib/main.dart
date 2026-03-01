import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/marketa_app.dart';
import 'core/app_function/auth_state_changes.dart';
import 'core/cubit/app_cubit.dart';
import 'core/database/cache_helper.dart';
import 'core/services/service_locator.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  authStateChanges();
  setupServiceLocator();
  await getIt<CacheHelper>().init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(
    BlocProvider(
      create: (context) => AppCubit(),
      child: const MarketaApp(),
    ),
  );
}

