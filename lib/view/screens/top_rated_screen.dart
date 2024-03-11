import 'package:flutter/material.dart';
import 'package:flutter_movie_app/controller/home_controller.dart';
import 'package:flutter_movie_app/view/widgets/movie_card_widget.dart';
import 'package:flutter_movie_app/view/widgets/search_widget.dart';
import 'package:get/get.dart';

class TopRatedScreen extends StatelessWidget {
  const TopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Top Rated"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchWidget(),
            GetBuilder<HomeController>(
              init: HomeController(),
                builder:(homeController)=>
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 4,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15),
                          itemCount:homeController.topRatedList.length,
                          itemBuilder: (BuildContext ctx, index){
                            return  MovieCardWidget(
                              image: homeController.topRatedList[index].posterPath??"",
                              name: homeController.topRatedList[index].title??"",
                              id: homeController.topRatedList[index].id??0,
                              isMovie: true,
                            );
                          }
                      ),
                    )
            ),

          ],
        ),
      ),
    );
  }
}
