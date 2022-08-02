import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/movie_details_page.dart';
import 'package:task1/provider/data_provider.dart';
import 'package:task1/widgets/movie_card.dart';

class SearchMoviePage extends StatefulWidget {
  SearchMoviePage({Key? key}) : super(key: key);

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onChanged: (text) {
            setState(() {
              text.isEmpty
                  ? dataProvider.emptySeachList()
                  : dataProvider.fetchSearchMovieData(text);
            });
          },
          cursorColor: Colors.white,
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'search movies',
              hintStyle: TextStyle(color: Colors.white)),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2 / 3),
            itemCount: dataProvider.searchList.length,
            itemBuilder: (context, index) => MovieCard(
                index: index,
                movieList: dataProvider.searchList,
                onTap: () {
                  dataProvider.setPlayingFalse();
                  dataProvider.getVideoId(dataProvider.searchList[index]['id']);
                  dataProvider
                      .getRecMovieUrl(dataProvider.searchList[index]['id']);
                  dataProvider.fetchRecommendedMovieData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetailPage(
                                index: index,
                                movieList: dataProvider.searchList,
                              )));
                })),
      ),
    );
  }
}
