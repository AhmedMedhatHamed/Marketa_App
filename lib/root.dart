import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/feature/product/presentation/cubit/product_cubit.dart';
import 'feature/cart/presentation/views/cart_view.dart';
import 'feature/home/presentation/views/home_view.dart';
import 'feature/profile/presentation/views/profile_view.dart';
import 'feature/search/presentation/views/search_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final PageController pageController = PageController();
  int currentIndex = 0;

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
      icon: Badge(label: Text('6'), child: Icon(IconlyLight.bag_2)),
      activeIcon: Icon(IconlyBold.bag_2),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyLight.profile),
      activeIcon: Icon(IconlyBold.profile),
      label: 'Profile',
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeView(),
          BlocProvider(
            create: (_) => ProductCubit(),
            child: const SearchView(),
          ),
          const CartView(),
          const ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppColor.primaryColor,
        onTap: changePage,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: bottomNavigationBarItemList,
      ),
    );
  }
}
