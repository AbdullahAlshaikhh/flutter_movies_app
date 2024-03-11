import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/constants/api_urls.dart';
import 'package:flutter_movie_app/helper/helper.dart';
import 'package:flutter_movie_app/repository/app_repository.dart';
import 'package:flutter_movie_app/view/screens/movie_details_screen.dart';
import 'package:get/get.dart';

import '../screens/tv_details_screen.dart';

class MovieCardWidget extends StatelessWidget {
  final String name;
  final String image;
  final bool isMovie;
  final int id;
  const MovieCardWidget({super.key, required this.name, required this.image, required this.isMovie, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: InkWell(
        onTap: () async {
          if(isMovie){
            HelperWidgets.loading();
            await AppRepository().getMovieDetails(id)
                .then((value){
              Get.back();
              Get.to( MovieDetailsScreen(
                movieDetails: value,
              ));
            });
          }else{
            HelperWidgets.loading();
            await AppRepository().getTvDetails(id)
                .then((value){
                  Get.back();
              Get.to( TvDetailsScreen(
                tvDetails: value,
              ));
            });
          }
        },
        child: SizedBox(
          height: Get.height *.26,
          width: Get.height *.16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:  image != ""?
                        "${ApiUrls.imagesPath}w500/$image":
                    ApiUrls.imagePlaceHolder,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: Get.theme.textTheme.labelLarge?.copyWith(
                  fontSize: 18
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
