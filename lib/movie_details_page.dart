import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/provider/data_provider.dart';
import 'package:task1/widgets/home.dart';
import 'package:task1/widgets/movie_card.dart';
import 'package:task1/widgets/movies.dart';
import 'package:task1/widgets/search_bar.dart';
import 'package:task1/widgets/trending_slider_card.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailPage extends StatefulWidget {
  int index;
  List movieList;
  MovieDetailPage({required this.index, required this.movieList});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
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
          dataProvider.playingTrailer
              ? SizedBox(
                  height: height * .35,
                  width: width,
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                        initialVideoId: dataProvider.videoId,
                        flags: const YoutubePlayerFlags()),
                    onEnded: (metadata) {
                      dataProvider.setPlayingFalse();
                    },
                  ),
                )
              : TrendingSliderCard(
                  backdrop: widget.movieList[widget.index]['backdrop_path'],
                  title: widget.movieList[widget.index]['title'],
                  trailerButton: true,
                ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 10, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * .32,
                  width: width * .45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/original${widget.movieList[widget.index]['poster_path']}'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: width * .39,
                  height: height * .32,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.movieList[widget.index]['title']}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                          text: 'Rating: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                          text:
                              '${widget.movieList[widget.index]['vote_average']}',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                      const SizedBox(
                        height: 1,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                          text: 'Total voting: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                          text:
                              '${widget.movieList[widget.index]['vote_count']}',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                      const SizedBox(
                        height: 1,
                      ),
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                          text: 'Genre: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Drama, Action',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
                      const SizedBox(
                        height: 1,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                          text: 'Popularity: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                          text:
                              '${widget.movieList[widget.index]['popularity']}',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                      const SizedBox(
                        height: 15,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                          text: 'language: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                          text:
                              '${widget.movieList[widget.index]['original_language']}',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                      const SizedBox(
                        height: 1,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                          text: 'Release: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                          text:
                              '${widget.movieList[widget.index]['release_date']}',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                                'https://pngimg.com/uploads/facebook_logos/facebook_logos_PNG19757.png'),
                          ),
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                                'https://th.bing.com/th/id/R.735dda68880a385ce8cc5be4f3c5fcd6?rik=qSxRw2lCZYy9Mw&riu=http%3a%2f%2fpngimg.com%2fuploads%2finstagram%2finstagram_PNG11.png&ehk=QVCbfkCKi8pJLF08bRkS%2fLeMqLTnJQf402WRaIdN6jE%3d&risl=&pid=ImgRaw&r=0'),
                          ),
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                                'https://th.bing.com/th/id/R.9a3a06f78cc0a8d79fce59e2de6da146?rik=nLAu3Z%2f0QUb%2fVw&riu=http%3a%2f%2ficons.iconarchive.com%2ficons%2fiynque%2fios7-style%2f1024%2fTwitter-icon.png&ehk=eD3Hc5yQAyP3AKPJoYHB8yeWKwKdaVAswR5kxmodex4%3d&risl=&pid=ImgRaw&r=0'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Text('${widget.movieList[widget.index]['overview']}'),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 20, bottom: 20),
            child: Text(
              'RECOMMENDED MOVIES',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          dataProvider.recMovieList.isEmpty
              ? const SizedBox()
              : SizedBox(
                  height: height * .38,
                  width: width * .4,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: dataProvider.recMovieList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: MovieCard(
                            index: index,
                            movieList: dataProvider.recMovieList,
                            onTap: () {
                              dataProvider.setPlayingFalse();
                              dataProvider.getVideoId(
                                  dataProvider.recMovieList[index]['id']);
                              dataProvider.getRecMovieUrl(
                                  dataProvider.recMovieList[index]['id']);
                              dataProvider.fetchRecommendedMovieData();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetailPage(
                                            index: index,
                                            movieList:
                                                dataProvider.recMovieList,
                                          )));
                            },
                          ),
                        );
                      }),
                )
        ],
      ),
    );
  }
}
