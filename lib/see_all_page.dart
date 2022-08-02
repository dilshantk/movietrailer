import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/provider/data_provider.dart';
import 'package:task1/widgets/home.dart';
import 'package:task1/widgets/movie_card.dart';
import 'package:task1/widgets/movies.dart';
import 'package:task1/widgets/search_bar.dart';

import 'movie_details_page.dart';

class SeeAllPAge extends StatelessWidget {
  List itemList;
  SeeAllPAge({required this.itemList});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var dataProvider = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Image(
                  image: NetworkImage(
                'https://deadline.com/wp-content/uploads/2020/03/20th-century-studios-logo-black.jpg',
              )),
            ),
          ),
          title: SizedBox(
            child: Row(
              children: [
                const HomeWiget(),
                const SizedBox(
                  width: 15,
                ),
                const MoviesWiget(),
                const SizedBox(
                  width: 30,
                ),
                SearchBar()
              ],
            ),
          )),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 3),
              itemCount: itemList.length,
              itemBuilder: (context, index) => MovieCard(
                  index: index,
                  movieList: itemList,
                  onTap: () {
                    dataProvider.setPlayingFalse();
                    dataProvider.getVideoId(itemList[index]['id']);
                    dataProvider.getRecMovieUrl(itemList[index]['id']);
                    dataProvider.fetchRecommendedMovieData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetailPage(
                                  index: index,
                                  movieList: itemList,
                                )));
                  })),
        ),
      ),
    );
  }
}
