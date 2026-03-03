import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/database/cache_helper.dart';
import 'package:marketa/core/services/service_locator.dart';
import 'package:marketa/feature/cart/presentation/views/cart_view.dart';
import 'package:marketa/feature/home/presentation/home_view.dart';
import 'package:marketa/feature/profile/presentation/views/profile_view.dart';
import 'package:marketa/feature/search/presentation/views/search_view.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial()) {
    loadTheme();
  }

  bool isDark = false;

  void loadTheme() {
    isDark = getIt<CacheHelper>().getData(key: 'isDark') ?? false;
    emit(AppThemeChanged(isDark));
  }

  void toggleTheme(bool value) {
    isDark = value;
    getIt<CacheHelper>().saveData(key: 'isDark', value: value);
    emit(AppThemeChanged(isDark));
  }

  final PageController pageController = PageController();
  int currentIndex = 0;
  final List<Widget> screens = const [
    HomeView(),
    SearchView(),
    CartView(),
    ProfileView(),
  ];

 final List<BottomNavigationBarItem> bottomNavigationBarItemList = [
    BottomNavigationBarItem(
      icon: Icon(IconlyLight.home),
      activeIcon: Icon(IconlyBold.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyLight.search),
      activeIcon: Icon(IconlyBold.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyLight.bag_2),
      activeIcon: Icon(IconlyBold.bag_2),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyLight.profile),
      activeIcon: Icon(IconlyBold.profile),
      label: 'Profile',
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    emit(ChangeBottomNavBarState());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
