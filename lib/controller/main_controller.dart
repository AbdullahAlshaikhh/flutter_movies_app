import 'package:flutter/material.dart';
import 'package:flutter_movie_app/constants/app_colors.dart';
import 'package:get/get.dart';

import '../view/screens/home_screen.dart';
import '../view/screens/top_rated_screen.dart';
import '../view/screens/wishlist_screen.dart';

class MainController extends GetxController{
  List<Widget> screens = [
    const TopRatedScreen(),
    const HomeScreen(),
    const WishlistScreen(),
  ];

  List<BottomNavigationBarItem> itemsList = [
    const BottomNavigationBarItem(
        icon: Icon(
            Icons.local_fire_department_sharp,
          color: Colors.white54,
        ),
        activeIcon: Icon(
            Icons.local_fire_department_sharp,
          color: AppColors.mainColor,
        ),
        label: ""
    ),
    const BottomNavigationBarItem(
        icon: Icon(
            Icons.home,
          color: Colors.white54,
        ),
        activeIcon: Icon(
            Icons.home,
          color: AppColors.mainColor,
        ),
      label: ""
    ),
    const BottomNavigationBarItem(
        icon: Icon(
            Icons.favorite,
          color: Colors.white54,
        ),
        activeIcon: Icon(
            Icons.favorite,
          color: AppColors.mainColor,
        ),
        label: ""
    ),
  ];
  int currentIndex = 1;
}