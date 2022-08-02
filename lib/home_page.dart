import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/movie_details_page.dart';
import 'package:task1/provider/data_provider.dart';
import 'package:task1/provider/home_page_provider.dart';
import 'package:task1/see_all_page.dart';
import 'package:task1/widgets/home.dart';
import 'package:task1/widgets/movie_card.dart';
import 'package:task1/widgets/movies.dart';
import 'package:task1/widgets/search_bar.dart';
import 'package:task1/widgets/trending_slider_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    var dataProvider = Provider.of<DataProvider>(context, listen: false);
    var homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    homePageProvider.selectMoviesPage();
    dataProvider.fetchTrendingMovieData();
    dataProvider.fetchUpComingMovieData();
    dataProvider.fetchTopRatedMovieData();
    dataProvider.fetchPopularMovieData();
    dataProvider.fetchLatestMovieData();
    dataProvider.fetchNowPlayingMovieData();
    dataProvider.fetchRecommendedMovieData();
    super.initState();
  }

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
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            child: dataProvider.trendingMovieList.isEmpty
                ? const SizedBox()
                : CarouselSlider.builder(
                    itemCount: dataProvider.trendingMovieList.length,
                    itemBuilder: (context, index, realIndex) {
                      return GestureDetector(
                        onTap: () {
                          dataProvider.setPlayingFalse();
                          dataProvider.getRecMovieUrl(
                              dataProvider.trendingMovieList[index]['id']);
                          dataProvider.getVideoId(
                              dataProvider.trendingMovieList[index]['id']);
                          dataProvider
                              .fetchRecommendedMovieData()
                              .then((value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetailPage(
                                            index: index,
                                            movieList:
                                                dataProvider.trendingMovieList,
                                          ))));
                        },
                        child: TrendingSliderCard(
                          backdrop: dataProvider.trendingMovieList[index]
                              ['backdrop_path'],
                          title: dataProvider.trendingMovieList[index]['title'],
                          trailerButton: false,
                        ),
                      );
                    },
                    options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2))),
          ),
          CategoryBuilder(
              itemList: dataProvider.nowPlayinMoviesList,
              category: 'NOW PLAYING MOVIES'),
          CategoryBuilder(
              itemList: dataProvider.upComingMoviesList,
              category: 'UPCOMING MOVIES'),
          CategoryBuilder(
              itemList: dataProvider.topRatedMoviesList,
              category: 'TOPRATED MOVIES'),
          CategoryBuilder(
            itemList: dataProvider.populatMoviesList,
            category: 'POPULAR MOVIES',
          ),
          // CategoryBuilder(
          //     itemList: dataProvider.latestMoviesList,
          //     category: 'LATEST MOVIES'),
          Container(
            height: height * .35,
            width: width,
            color: Colors.black,
            child: const Center(
              child: Text(
                '             Searchlight       Radeem Digital Codes\n\nTerms of Use      Privacy Policy     Interest-Based Ads\n\n'
                '             Do Not Sell My Personal Information\n\n\n\n\n'
                ' @2022 20th Century Studios. All Rights Reserved',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryBuilder extends StatefulWidget {
  List itemList;
  String category;
  CategoryBuilder({required this.itemList, required this.category});

  @override
  State<CategoryBuilder> createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var dataProvider = Provider.of<DataProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10.0, top: 10, bottom: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.category,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SeeAllPAge(itemList: widget.itemList)));
                },
                child: const Text(
                  'See all',
                  style: TextStyle(
                      color: Color(0xffa36c07), fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        widget.itemList.isEmpty
            ? const SizedBox()
            : SizedBox(
                height: height * .38,
                width: width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: widget.itemList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: MovieCard(
                          index: index,
                          movieList: widget.itemList,
                          onTap: () {
                            dataProvider.setPlayingFalse();
                            dataProvider
                                .getVideoId(widget.itemList[index]['id']);
                            dataProvider
                                .getRecMovieUrl(widget.itemList[index]['id']);
                            dataProvider.fetchRecommendedMovieData();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDetailPage(
                                          index: index,
                                          movieList: widget.itemList,
                                        )));
                          },
                        ),
                      );
                    }),
              ),
      ],
    );
  }
}
