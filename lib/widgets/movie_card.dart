import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/movie_details_page.dart';

import '../provider/data_provider.dart';

class MovieCard extends StatelessWidget {
  int index;
  List movieList;
  Function onTap;
  MovieCard(
      {required this.index, required this.movieList, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        dataProvider.setPlayingFalse;
        onTap();
      },
      child: SizedBox(
        height: height * .38,
        width: width * .4,
        child: Column(
          children: [
            Container(
              height: height * .28,
              width: width * .4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/original${movieList[index]['poster_path']}'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: width * .4,
              child: Text(
                '${movieList[index]['title']}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
