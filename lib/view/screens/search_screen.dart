import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/constants/app_colors.dart';
import 'package:flutter_movie_app/controller/search_controller.dart';
import 'package:flutter_movie_app/view/widgets/search_widget.dart';
import 'package:get/get.dart';

import '../../constants/api_urls.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySearchController>(
      init: MySearchController(),
        builder:(controller){
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Search"),
              automaticallyImplyLeading: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SearchWidget(),
                  ListView.builder(
                      itemCount: controller.searchResults.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.mainColor)
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl:  controller.searchResults[index].posterPath
                                     != null && controller.searchResults[index].posterPath != ""?
                                    "${ApiUrls.imagesPath}w500/${controller.searchResults[index].posterPath}":
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
                                          controller.searchResults[index].title != null
                                          && controller.searchResults[index].title != ""?
                                          controller.searchResults[index].title??"":
                                          controller.searchResults[index].name??"",
                                          overflow: TextOverflow.ellipsis,
                                          style: Get.theme.textTheme.labelLarge?.copyWith(
                                              fontSize: 18
                                          ),
                                        ),
                                        Text(
                                          controller.searchResults[index].overview??"",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: Get.theme.textTheme.labelLarge?.copyWith(

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
