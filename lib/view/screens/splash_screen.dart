import 'package:flutter/material.dart';
import 'package:flutter_movie_app/constants/app_colors.dart';
import 'package:flutter_movie_app/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
        builder: (controller){
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      AnimatedContainer(
                        height: controller.initialImageHeight,
                        curve: Curves.decelerate,
                        duration: const Duration(milliseconds: 1500),
                        child: Image.asset(
                          height: controller.initialImageHeight,
                          width: 300,
                          'assets/logo.png',
                          color: AppColors.mainColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          controller.initialImageHeight == 200?
                          "Alshaikh Movies":"",
                          style: Get.theme.textTheme.titleLarge?.copyWith(
                              color: AppColors.mainColor.withOpacity(.6)
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
