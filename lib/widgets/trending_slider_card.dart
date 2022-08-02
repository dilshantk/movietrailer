import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/data_provider.dart';

class TrendingSliderCard extends StatelessWidget {
  String backdrop;
  String title;
  bool trailerButton;
  TrendingSliderCard(
      {required this.backdrop,
      required this.title,
      required this.trailerButton});

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * .35,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .35,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/original$backdrop'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              left: 30,
              bottom: 10,
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  trailerButton
                      ? GestureDetector(
                          onTap: () {
                            dataProvider.setPlayingTrue();
                          },
                          child: Container(
                            height: 30,
                            width: 110,
                            color: const Color(0xffa36c07),
                            child: const Center(
                              child: Text(
                                'WATCH TRAILER',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              )),
        ],
      ),
    );
  }
}
