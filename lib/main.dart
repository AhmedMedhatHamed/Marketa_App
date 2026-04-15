import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/feature/auth/presenatation/cubit/auth_cubit.dart';
import 'package:marketa/feature/product/presentation/cubit/product_cubit.dart';
import 'package:marketa/feature/profile/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:marketa/feature/profile/presentation/cubit/viewed_cubit/viewed_cubit.dart';
import 'package:marketa/feature/profile/presentation/cubit/wishlist_cubit/wishlist_cubit.dart';
import 'app/marketa_app.dart';
import 'core/app_function/auth_state_changes.dart';
import 'core/database/cache_helper.dart';
import 'feature/cart/presentation/cubit/cart_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper().init();
  authStateChanges();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => ProductCubit()),
        BlocProvider(create: (_) => WishlistCubit()),
        BlocProvider(create: (_) => ViewedCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => UserCubit()),
      ],
      child: const MarketaApp(),
    ),
  );
}