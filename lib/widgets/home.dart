import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/home_page.dart';

import '../provider/home_page_provider.dart';

class HomeWiget extends StatelessWidget {
  const HomeWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homePageProvider = Provider.of<HomePageProvider>(context);
    return GestureDetector(
      onTap: () {
        homePageProvider.selectMoviesPage();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      },
      child: Column(
        children: [
          const Text(
            "Movies",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(
            height: 5,
          ),
          homePageProvider.isMoviesPage
              ? Container(
                  width: 45,
                  height: 3,
                  color: const Color(0xffa36c07),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
