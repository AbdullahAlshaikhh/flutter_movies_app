import 'package:flutter_movie_app/repository/app_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/movie_details_model.dart';
import '../model/tv_details_model.dart';


class WishlistController extends GetxController{
  List<String> myTvWishlist = [];
  List<String> myMovieWishlist = [];
  List<TvDetailsModel> tvList = [];
  List<MovieDetailsModel> movieList = [];


  fetchWishlist() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    myTvWishlist = shared.getStringList("myTvWishlist")??[];
    myMovieWishlist = shared.getStringList("myMovieWishlist")??[];
    update();
    for (var element in myTvWishlist) {
      AppRepository().getTvDetails(element).then((value) {
        tvList.add(value);
        update();
      });
    }
    for (var element in myMovieWishlist) {
      AppRepository().getMovieDetails(element).then((value) {
        movieList.add(value);
        update();
      });
    }
  }
  addTvToWishlist(id) async {
    fetchWishlist();
    SharedPreferences shared = await SharedPreferences.getInstance();
    myTvWishlist.add("$id");
    update();
    shared.setStringList("myTvWishlist", myTvWishlist);
  }
  addMovieToWishlist(id) async {
    fetchWishlist();
    SharedPreferences shared = await SharedPreferences.getInstance();
    myMovieWishlist.add("$id");
    update();
    shared.setStringList("myMovieWishlist", myMovieWishlist);
  }
  removeTvFromList(id) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    myTvWishlist.removeWhere((element) => element == "$id");
    update();
    shared.setStringList("myTvWishlist", myTvWishlist).then((value) {
      fetchWishlist();
    });
  }
  removeMovieFromList(id) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    myMovieWishlist.removeWhere((element) => element == "$id");
    update();
    shared.setStringList("myMovieWishlist", myMovieWishlist).then((value) {
      fetchWishlist();
    });
  }

  @override
  void onInit() {
   fetchWishlist();
    super.onInit();
  }
}