import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeopleDataProvider extends ChangeNotifier {
  final String apiKey = 'f7187c443189e79bf43bab305cb9d356';

  List popularPeopleList = [];
  List latestPeopleList = [];
  List peopleImageList = [];
  String biography = "no data";

  var popularPeopleUrl =
      'https://api.themoviedb.org/3/person/popular?api_key=f7187c443189e79bf43bab305cb9d356&language=en-US&page=1';
  var latestPeopleUrl =
      'https://api.themoviedb.org/3/person/latest?api_key=f7187c443189e79bf43bab305cb9d356&language=en-US';

  Future getPeopleDetails(int id) async {
    String peopleDetailUrl =
        'https://api.themoviedb.org/3/person/$id?api_key=f7187c443189e79bf43bab305cb9d356&language=en-US';
    var response = await http.get(Uri.parse(peopleDetailUrl));
    var jsonData = json.decode(response.body);
    biography = jsonData['biography'];
    notifyListeners();
  }

  Future fetchPopularPeopleData() async {
    var response = await http.get(Uri.parse(popularPeopleUrl));
    var jsonData = json.decode(response.body);
    popularPeopleList = jsonData['results'];
    notifyListeners();
  }

  Future fetchLatestPeopleData() async {
    var response = await http.get(Uri.parse(latestPeopleUrl));
    var jsonData = json.decode(response.body);
    latestPeopleList = jsonData['results'];
    notifyListeners();
  }

  Future fetchPeopleImages(int id) async {
    String peopleImageUrl =
        'https://api.themoviedb.org/3/person/$id/images?api_key=f7187c443189e79bf43bab305cb9d356';
    var response = await http.get(Uri.parse(peopleImageUrl));
    var jsonData = json.decode(response.body);
    peopleImageList = jsonData['profiles'];
    notifyListeners();
  }
}
