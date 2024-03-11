import 'package:flutter_movie_app/helper/helper.dart';
import 'package:flutter_movie_app/repository/app_repository.dart';
import 'package:get/get.dart';

import '../model/search_model.dart';

class MySearchController extends GetxController{
  List<SearchResult> searchResults = [];

  startSearch(text) async {
    searchResults = [];
    update();
    await AppRepository().search(text).then((value){
      if(value.results != null && value.results!.isNotEmpty){
        searchResults = value.results??[];
        update();
      }else{
        HelperWidgets().showError("Search", "There is no result found!");
      }
    });
  }
}