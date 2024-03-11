import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/controller/wishlist_controller.dart';
import 'package:get/get.dart';

import '../../constants/api_urls.dart';
import '../../constants/app_colors.dart';
import '../../model/tv_details_model.dart';

class TvDetailsScreen extends StatelessWidget {
  final TvDetailsModel tvDetails;
  const TvDetailsScreen({super.key, required this.tvDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height *.5,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                  // imageUrl:  image != ""?
                  // "${ApiUrls.imagesPath}w500/$image":
                  // ApiUrls.imagePlaceHolder,
                  imageUrl: "${ApiUrls.imagesPath}w500/${tvDetails.posterPath}",
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                  fit: BoxFit.cover,
                  height: Get.height *.5,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.darkContainerColor.withOpacity(.8)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back_ios_new
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GetBuilder<WishlistController>(
                    init: WishlistController(),
                      builder:(wishlistController)=>
                          InkWell(
                            onTap: (){
                              if(wishlistController.myTvWishlist.
                              contains("${tvDetails.id}")){
                                wishlistController.removeTvFromList(tvDetails.id??0);
                              }else{
                                wishlistController.addTvToWishlist(tvDetails.id??0);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.darkContainerColor.withOpacity(.85)
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                      wishlistController.myTvWishlist.
                                      contains("${tvDetails.id}")?
                                      Icons.favorite:
                                      Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 1.9,
              child: Container(
                width: double.infinity,
                height: Get.height *.6,
                decoration: BoxDecoration(
                  color:Get.theme.scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: Get.height *.05,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                  tvDetails.originalName??"",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Get.theme.textTheme.titleLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "${tvDetails.numberOfSeasons??1} Seasons/${tvDetails.numberOfEpisodes??1} episodes",
                              style: Get.theme.textTheme.labelLarge,
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star_rate,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    "${tvDetails.voteAverage??0.0}",
                                    style: Get.theme.textTheme.labelLarge?.copyWith(fontSize: 18),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                              "First release on ${tvDetails.firstAirDate??""}",
                              style: Get.theme.textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                        child: Row(
                          children: List.generate(
                              tvDetails.genres?.length??0,
                                  (index) =>
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: AppColors.mainColor
                                              )
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                            child: Text(
                                              tvDetails.genres?[index].name??"",
                                              style: Get.theme.textTheme.labelLarge?.copyWith(
                                                  color: AppColors.mainColor
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                          )
                        ),
                      ),
                      SizedBox(height: Get.height *.02,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                        child: Row(
                          children: [
                            Text(
                              "Overview",
                              style: Get.theme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                tvDetails.overview??'',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                style: const TextStyle(
                                  color: Colors.white54
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height *.015,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                        child: Row(
                          children: [
                            Text(
                              "Networks",
                              style: Get.theme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: List.generate(
                              tvDetails.networks?.length??0,
                                  (index) =>
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          height: 65,
                                          width: 65,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: NetworkImage(
                                                      "${ApiUrls.imagesPath}w500/${tvDetails.networks?[index].logoPath??""}"
                                                  )
                                              )
                                          ),
                                        ),
                                      ),
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
