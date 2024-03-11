import 'package:flutter/material.dart';
import 'package:flutter_movie_app/constants/app_colors.dart';
import 'package:flutter_movie_app/controller/main_controller.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
        builder:(controller){
          return Scaffold(
            body: controller.screens[controller.currentIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: AppColors.paragraphColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )
              ),
              child: BottomNavigationBar(
                items: controller.itemsList,
                currentIndex: controller.currentIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: Colors.transparent,
                fixedColor: Colors.transparent,
                useLegacyColorScheme: false,
                onTap: (index){
                  controller.currentIndex = index;
                  controller.update();
                },
              ),
            ),
          );
        }
    );
  }
}
