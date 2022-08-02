import 'package:flutter/material.dart';
import 'package:task1/search_movie_page.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SearchMoviePage()));
      },
      child: Container(
        height: 30,
        width: 120,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.white, width: .3)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(
                left: 3.0,
                right: 3,
              ),
              child: Icon(
                Icons.search_sharp,
                size: 15,
              ),
            ),
            Text(
              'search movie',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
