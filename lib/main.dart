import 'package:flutter/material.dart';
import 'package:flutter_movie_app/theme/app_theme.dart';
import 'package:flutter_movie_app/view/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.dark,
      home: const SplashScreen(),
    );
  }
}
