import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/home_page.dart';
import 'package:task1/provider/data_provider.dart';
import 'package:task1/provider/people_data_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.fetchTrendingMovieData();
    dataProvider.fetchUpComingMovieData();
    dataProvider.fetchTopRatedMovieData();
    dataProvider.fetchPopularMovieData();
    dataProvider.fetchLatestMovieData();
    dataProvider.fetchNowPlayingMovieData();
    dataProvider.fetchRecommendedMovieData();
    var peopleDataProvider =
        Provider.of<PeopleDataProvider>(context, listen: false);
    peopleDataProvider.fetchPopularPeopleData();
    Timer(const Duration(seconds: 2), (() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}
