import 'package:flutter/material.dart';
import 'package:marketa/core/router/app_router.dart';
import 'package:marketa/core/utills/app_strings.dart';

class MarketaApp extends StatelessWidget {
  const MarketaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      routerConfig: router,
    );
  }
}