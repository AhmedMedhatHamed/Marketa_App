import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:marketa/core/database/cache_helper.dart';
import 'package:marketa/core/services/service_locator.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial()) {
    loadTheme();
  }

  bool isDark = false;

  void loadTheme() {
    final isDark = getIt<CacheHelper>().getData(key: 'isDark') == true;
    emit(AppThemeChanged(isDark));
  }

  void toggleTheme(bool value) {
    isDark = value;
    getIt<CacheHelper>().saveData(key: 'isDark', value: value);
    emit(AppThemeChanged(isDark));
  }
}
