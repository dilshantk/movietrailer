import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/provider/data_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * .35,
            width: width,
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                  initialVideoId: 'kOiI3x-VVIo',
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                  )),
              onEnded: (metadata) {
                Navigator.pop(context);
              },
            ),
          ),
          GestureDetector(
              onTap: () {
                dataProvider
                    .getVideoId(170178)
                    .then((value) => print(dataProvider.videoId));
              },
              child: Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
