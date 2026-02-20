import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:marketa/core/utills/cache_helper.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial()) {
    loadTheme();
  }

  bool isDark = false;

  void loadTheme() {
    isDark = CacheHelper.getData(key: 'isDark');
    emit(AppThemeChanged(isDark));
  }

  void toggleTheme(bool value) {
    isDark = value;
    CacheHelper.saveData(key: 'isDark', value: value);
    emit(AppThemeChanged(isDark));
  }
}
