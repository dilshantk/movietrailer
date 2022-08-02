import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/people_details_page.dart';
import 'package:task1/provider/people_data_provider.dart';
import 'package:task1/widgets/home.dart';
import 'package:task1/widgets/movies.dart';
import 'package:task1/widgets/people_card.dart';
import 'package:task1/widgets/search_bar.dart';

class SeeAllPeoplePage extends StatelessWidget {
  List itemList;
  SeeAllPeoplePage({required this.itemList});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var peopleDataProvider = Provider.of<PeopleDataProvider>(context);
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
                  crossAxisCount: 2, childAspectRatio: 6 / 10),
              itemCount: itemList.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    peopleDataProvider
                        .getPeopleDetails(
                            peopleDataProvider.popularPeopleList[index]['id'])
                        .then((value) => peopleDataProvider.fetchPeopleImages(
                            peopleDataProvider.popularPeopleList[index]['id']))
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PeopleDetailsPage(
                                    index: index,
                                    peopleList: peopleDataProvider
                                        .popularPeopleList))));
                  },
                  child: PeopleCard(
                      index: index, peopleList: itemList, onTap: () {}))),
        ),
      ),
    );
  }
}
