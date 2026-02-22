import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketa/feature/home/presentation/home_view.dart';
import 'package:marketa/feature/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:marketa/feature/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:marketa/feature/splash/presentation/splash_view.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        builder:
            (context, state)
        => const SplashView(),
    ),
    GoRoute(
      path: '/homeView',
      builder:
          (context, state)
      => const HomeView(),
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (context, state) => BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: OnBoardingView(),
      ),
    ),
  ],
);
