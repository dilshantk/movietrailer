import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/people_page.dart';
import 'package:task1/provider/home_page_provider.dart';

class MoviesWiget extends StatelessWidget {
  const MoviesWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homePageProvider = Provider.of<HomePageProvider>(context);
    return GestureDetector(
      onTap: () {
        homePageProvider.selectPeoplePage();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PeoplePage()));
      },
      child: Column(
        children: [
          const Text(
            "People",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(
            height: 5,
          ),
          homePageProvider.isPeoplePage
              ? Container(
                  width: 47,
                  height: 3,
                  color: const Color(0xffa36c07),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
