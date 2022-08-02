import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/movie_details_page.dart';
import 'package:task1/provider/data_provider.dart';
import 'package:task1/provider/home_page_provider.dart';
import 'package:task1/provider/people_data_provider.dart';
import 'package:task1/widgets/home.dart';
import 'package:task1/widgets/movie_card.dart';
import 'package:task1/widgets/movies.dart';
import 'package:task1/widgets/search_bar.dart';

class PeopleDetailsPage extends StatefulWidget {
  int index;
  List peopleList;
  PeopleDetailsPage({required this.index, required this.peopleList});

  @override
  State<PeopleDetailsPage> createState() => _PeopleDetailsPageState();
}

class _PeopleDetailsPageState extends State<PeopleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    var peopleDataProvider = Provider.of<PeopleDataProvider>(context);
    var homePageProvider = Provider.of<HomePageProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
            child: Container(
              height: height * .5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/original${widget.peopleList[widget.index]['profile_path']}'),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              '${peopleDataProvider.popularPeopleList[widget.index]['name']}',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(peopleDataProvider.biography),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'Known For',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: height * .38,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: peopleDataProvider
                    .popularPeopleList[widget.index]['known_for'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 10),
                    child: MovieCard(
                        index: index,
                        movieList: peopleDataProvider
                            .popularPeopleList[widget.index]['known_for'],
                        onTap: () {
                          homePageProvider.isMoviesPage;
                          dataProvider.setPlayingFalse();
                          dataProvider.getVideoId(
                              peopleDataProvider.popularPeopleList[widget.index]
                                  ['known_for'][index]['id']);
                          dataProvider.getRecMovieUrl(
                              peopleDataProvider.popularPeopleList[widget.index]
                                  ['known_for'][index]['id']);
                          dataProvider.fetchRecommendedMovieData();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailPage(
                                        index: index,
                                        movieList: peopleDataProvider
                                                .popularPeopleList[widget.index]
                                            ['known_for'],
                                      )));
                        }),
                  );
                }),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, bottom: 10),
            child: Text(
              'Image Gallery',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          CarouselSlider.builder(
              itemCount: peopleDataProvider.peopleImageList.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/original${peopleDataProvider.peopleImageList[index]['file_path']}'),
                          fit: BoxFit.cover)),
                );
              },
              options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  aspectRatio: 6 / 11,
                  autoPlayInterval: const Duration(seconds: 2)))
        ],
      ),
    );
  }
}
