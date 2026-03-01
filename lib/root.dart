import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/feature/cart/presentation/views/cart_view.dart';
import 'package:marketa/feature/home/presentation/home_view.dart';
import 'package:marketa/feature/profile/presentation/views/profile_view.dart';
import 'package:marketa/feature/search/presentation/views/search_view.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController controller;
  int currentIndex = 0;
  List<Widget> screens = [
    HomeView(),
    SearchView(),
    CartView(),
    ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentIndex);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          controller.jumpToPage(index);
        },
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.primaryColor,
        elevation: 0.0,
        currentIndex: currentIndex,
        items: [
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
        ],
      ),
    );
  }
}
