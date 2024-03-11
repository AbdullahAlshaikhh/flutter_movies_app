import 'package:flutter_movie_app/repository/app_repository.dart';
import 'package:get/get.dart';

import '../model/tv_model.dart';

class HomeController extends GetxController{
  List<Result> discoverTv = [];
  List<Result> discoverMovies = [];
  List<Result> topRatedList = [];

  fetchTvList() async {
    await AppRepository().discoverTv(1).then((value){
      discoverTv = value.results??[];
      update();
    });
  }
  fetchMoviesList() async {
    await AppRepository().discoverMovies(1).then((value){
      discoverMovies = value.results??[];
      update();
    });
  }
  fetchTopRatedList() async {
    await AppRepository().getTopRatedMovies().then((value){
      topRatedList = value.results??[];
      update();
    });
  }

  @override
  void onInit() {
   fetchTvList();
   fetchMoviesList();
   fetchTopRatedList();
    super.onInit();
  }
}