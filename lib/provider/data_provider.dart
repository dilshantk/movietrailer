import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataProvider extends ChangeNotifier {
  final String apiKey = 'f7187c443189e79bf43bab305cb9d356';
  List trendingMovieList = [];
  List upComingMoviesList = [];
  List topRatedMoviesList = [];
  List populatMoviesList = [];
  List nowPlayinMoviesList = [];
  List latestMoviesList = [];
  List recMovieList = [];
  List searchList = [];
  String recMovieUrl = '';
  String videoId = '';
  bool playingTrailer = false;

  var trendingMovieUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=f7187c443189e79bf43bab305cb9d356';

  var upComingMovieUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=f7187c443189e79bf43bab305cb9d356&language=en-US&page=1';
  var topRatedMovieUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=f7187c443189e79bf43bab305cb9d356&language=en-US&page=1';
  var popularMovieUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=f7187c443189e79bf43bab305cb9d356&language=en-US&page=1';
  var nowPlayingMovieUrl =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=f7187c443189e79bf43bab305cb9d356&language=en-US&page=1";
  var latestMovieUrl =
      'https://api.themoviedb.org/3/movie/latest?api_key=f7187c443189e79bf43bab305cb9d356&language=en-US';

  void getRecMovieUrl(int id) {
    recMovieUrl =
        'https://api.themoviedb.org/3/movie/$id/recommendations?api_key=$apiKey&language=en-US&page=1';
    notifyListeners();
  }

  Future getVideoId(int id) async {
    String videoUrl =
        'https://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey&language=en-US';
    var response = await http.get(Uri.parse(videoUrl));
    var jsonData = json.decode(response.body);
    List videoDetails = jsonData['results'];
    videoId = videoDetails[0]['key'];
    notifyListeners();
  }

  void setPlayingFalse() {
    playingTrailer = false;
    notifyListeners();
  }

  void setPlayingTrue() {
    playingTrailer = true;
    notifyListeners();
  }

  Future fetchTrendingMovieData() async {
    var response = await http.get(Uri.parse(trendingMovieUrl));
    var jsonData = json.decode(response.body);
    trendingMovieList = jsonData['results'];
    notifyListeners();
  }

  Future fetchUpComingMovieData() async {
    var response = await http.get(Uri.parse(upComingMovieUrl));
    var jsonData = json.decode(response.body);
    upComingMoviesList = jsonData['results'];
    notifyListeners();
  }

  Future fetchTopRatedMovieData() async {
    var response = await http.get(Uri.parse(topRatedMovieUrl));
    var jsonData = json.decode(response.body);
    topRatedMoviesList = jsonData['results'];
    notifyListeners();
  }

  Future fetchPopularMovieData() async {
    var response = await http.get(Uri.parse(popularMovieUrl));
    var jsonData = json.decode(response.body);
    populatMoviesList = jsonData['results'];
    notifyListeners();
  }

  Future fetchNowPlayingMovieData() async {
    var response = await http.get(Uri.parse(nowPlayingMovieUrl));
    var jsonData = json.decode(response.body);
    nowPlayinMoviesList = jsonData['results'];
    notifyListeners();
  }

  Future fetchLatestMovieData() async {
    var response = await http.get(Uri.parse(latestMovieUrl));
    var jsonData = json.decode(response.body);
    latestMoviesList = jsonData['results'];
    notifyListeners();
  }

  Future fetchRecommendedMovieData() async {
    var response = await http.get(Uri.parse(recMovieUrl));
    var jsonData = json.decode(response.body);
    recMovieList = jsonData['results'];
    notifyListeners();
  }

  Future fetchSearchMovieData(String searchtxt) async {
    String searchUrl =
        'https://api.themoviedb.org/3/search/movie?api_key=f7187c443189e79bf43bab305cb9d356&language=en-US&page=1&include_adult=false&query=$searchtxt';
    var response = await http.get(Uri.parse(searchUrl));
    var jsonData = json.decode(response.body);
    searchList = jsonData['results'];
    notifyListeners();
  }

  void emptySeachList() {
    searchList = [];
    notifyListeners();
  }
}
