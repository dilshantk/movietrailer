import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  bool isMoviesPage = true;
  bool isPeoplePage = false;

  void selectMoviesPage() {
    isMoviesPage = true;
    isPeoplePage = false;
    notifyListeners();
  }

  void selectPeoplePage() {
    isMoviesPage = false;
    isPeoplePage = true;
    notifyListeners();
  }
}
