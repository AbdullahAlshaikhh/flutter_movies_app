import 'dart:convert';
import 'dart:developer';

import 'package:flutter_movie_app/constants/api_urls.dart';
import 'package:http/http.dart' as http;

import '../model/movie_details_model.dart';
import '../model/search_model.dart';
import '../model/tv_details_model.dart';
import '../model/tv_model.dart';

class AppRepository{
  Future<TvModel> discoverTv(int? page) async {
    var request = http.Request('GET', Uri.parse('${ApiUrls.discoverTv}&page=$page&api_key=${ApiUrls.apiKey}'));


    http.StreamedResponse response = await request.send();

    String responseResults = await response.stream.bytesToString();
    if (response.statusCode == 200) {
     log(responseResults);
     return TvModel.fromJson(json.decode(responseResults));
    }
    else {
      log("${response.reasonPhrase}");
      log(responseResults);
    return TvModel.fromJson(json.decode(responseResults));
    }
  }
  Future<TvModel> discoverMovies(int? page) async {
    var request = http.Request('GET', Uri.parse('${ApiUrls.discoverMovies}&page=$page&api_key=${ApiUrls.apiKey}'));


    http.StreamedResponse response = await request.send();

    String responseResults = await response.stream.bytesToString();
    if (response.statusCode == 200) {
     log(responseResults);
     return TvModel.fromJson(json.decode(responseResults));
    }
    else {
      log("${response.reasonPhrase}");
      log(responseResults);
    return TvModel.fromJson(json.decode(responseResults));
    }
  }
  Future<SearchModel> search(query) async {
    var request = http.Request('GET', Uri.parse('${ApiUrls.search}=$query&api_key=${ApiUrls.apiKey}'));


    http.StreamedResponse response = await request.send();

    String responseResults = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      log(responseResults);
      return SearchModel.fromJson(json.decode(responseResults));
    }
    else {
      log("${response.reasonPhrase}");
      log(responseResults);
      return SearchModel.fromJson(json.decode(responseResults));
    }
  }
  Future<TvDetailsModel> getTvDetails(id) async {
    var request = http.Request('GET', Uri.parse('${ApiUrls.getTvDetails}$id?api_key=${ApiUrls.apiKey}'));


    http.StreamedResponse response = await request.send();

    String responseResults = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      log(responseResults);
      return TvDetailsModel.fromJson(json.decode(responseResults));
    }
    else {
      log("${response.reasonPhrase}");
      log(responseResults);
      return TvDetailsModel.fromJson(json.decode(responseResults));
    }
  }
  Future<MovieDetailsModel> getMovieDetails(id) async {
    var request = http.Request('GET', Uri.parse('${ApiUrls.getMovieDetails}$id?api_key=${ApiUrls.apiKey}'));


    http.StreamedResponse response = await request.send();

    String responseResults = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      log(responseResults);
      return MovieDetailsModel.fromJson(json.decode(responseResults));
    }
    else {
      log("${response.reasonPhrase}");
      log(responseResults);
      return MovieDetailsModel.fromJson(json.decode(responseResults));
    }
  }
  Future<TvModel> getSimilarMovies(int? id) async {
    var request = http.Request('GET', Uri.parse('${ApiUrls.getMovieDetails}$id/similar?api_key=${ApiUrls.apiKey}'));


    http.StreamedResponse response = await request.send();

    String responseResults = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      log(responseResults);
      return TvModel.fromJson(json.decode(responseResults));
    }
    else {
      log("${response.reasonPhrase}");
      log(responseResults);
      return TvModel.fromJson(json.decode(responseResults));
    }
  }
  Future<TvModel> getTopRatedMovies() async {
    var request = http.Request('GET', Uri.parse('${ApiUrls.getTopRatedMovies}?api_key=${ApiUrls.apiKey}'));


    http.StreamedResponse response = await request.send();

    String responseResults = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      log(responseResults);
      return TvModel.fromJson(json.decode(responseResults));
    }
    else {
      log("${response.reasonPhrase}");
      log(responseResults);
      return TvModel.fromJson(json.decode(responseResults));
    }
  }
}