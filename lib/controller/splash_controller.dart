import 'package:flutter_movie_app/view/screens/main_screen.dart';
import 'package:get/get.dart';


class SplashController extends GetxController{


  double initialHeight = 200;
  double? initialImageHeight;
  double expandedImageHeight = 25;
  void poopAnimationIn() async {
    initialImageHeight = expandedImageHeight;
    update();
    await Future.delayed(const Duration(milliseconds: 1500), () {
      initialImageHeight = initialHeight;
      update();
    });
  }

  startApp(){
    Future.delayed(const Duration(
      seconds: 3
    )).whenComplete(() {
      Get.offAll(const MainScreen());
    });
  }
  @override
  void onInit() {
    initialImageHeight = initialHeight;
    update();
    poopAnimationIn();
    startApp();
    super.onInit();
  }
}