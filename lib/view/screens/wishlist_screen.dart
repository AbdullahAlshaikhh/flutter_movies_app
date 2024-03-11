import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/controller/wishlist_controller.dart';
import 'package:get/get.dart';

import '../../constants/api_urls.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistController>(
      init: WishlistController(),
        builder:(controller){
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("My Wishlist"),
            ),
            body:  Column(
              children: [
                ListView.builder(
                    itemCount: controller.tvList.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            color: Colors.black54,
                            border: Border.all(color: Colors.black)
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl:  controller.tvList[index].posterPath
                                        != null && controller.tvList[index].posterPath != ""?
                                    "${ApiUrls.imagesPath}w500/${controller.tvList[index].posterPath}":
                                    ApiUrls.imagePlaceHolder,
                                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                                    fit: BoxFit.cover,
                                    height: Get.height *.13,
                                    width: Get.height *.13,
                                  )
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.tvList[index].name??"",
                                        overflow: TextOverflow.ellipsis,
                                        style: Get.theme.textTheme.labelLarge?.copyWith(
                                            fontSize: 18
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                          "Type: ${controller.tvList[index].type??""}",
                                          overflow: TextOverflow.ellipsis,
                                          style: Get.theme.textTheme.labelLarge?.copyWith(
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.star_rate,
                                              color: Colors.amber,
                                            ),
                                            Text(
                                              "${controller.tvList[index].voteAverage??0.0}",
                                              style: Get.theme.textTheme.labelLarge?.copyWith(fontSize: 18),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                ListView.builder(
                    itemCount: controller.movieList.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            color: Colors.black54,
                            border: Border.all(color: Colors.black)
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl:  controller.movieList[index].posterPath
                                        != null && controller.movieList[index].posterPath != ""?
                                    "${ApiUrls.imagesPath}w500/${controller.movieList[index].posterPath}":
                                    ApiUrls.imagePlaceHolder,
                                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                                    fit: BoxFit.cover,
                                    height: Get.height *.13,
                                    width: Get.height *.13,
                                  )
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.movieList[index].title??"",
                                        overflow: TextOverflow.ellipsis,
                                        style: Get.theme.textTheme.labelLarge?.copyWith(
                                            fontSize: 18
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                          "Type: ${controller.movieList[index].genres?.first.name??""}",
                                          overflow: TextOverflow.ellipsis,
                                          style: Get.theme.textTheme.labelLarge?.copyWith(
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.star_rate,
                                              color: Colors.amber,
                                            ),
                                            Text(
                                              "${controller.movieList[index].voteAverage??0.0}",
                                              style: Get.theme.textTheme.labelLarge?.copyWith(fontSize: 18),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ],
            )
          );
        });
  }
}
