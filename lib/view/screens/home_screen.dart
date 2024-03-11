import 'package:flutter/material.dart';
import 'package:flutter_movie_app/controller/home_controller.dart';
import 'package:get/get.dart';

import '../widgets/movie_card_widget.dart';
import '../widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
        builder:(homeController){
          return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: Get.height *.03),
                  child: const SearchWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Text(
                          "Discover TV show",
                          style: Get.theme.textTheme.headlineSmall
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children:  List.generate(
                            homeController.discoverTv.length,
                                (index) => MovieCardWidget(
                                  image: homeController.discoverTv[index].posterPath??"",
                                  name: homeController.discoverTv[index].name??"",
                                  id: homeController.discoverTv[index].id??0,
                                  isMovie: false,
                                )
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Text(
                          "Discover Movies",
                          style: Get.theme.textTheme.headlineSmall
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children:  List.generate(
                            homeController.discoverMovies.length,
                                (index) => MovieCardWidget(
                                  image: homeController.discoverMovies[index].posterPath??"",
                                  name: homeController.discoverMovies[index].title??"",
                                  id: homeController.discoverMovies[index].id??0,
                                  isMovie: true,
                                )
                        )
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
