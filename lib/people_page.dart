import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/people_details_page.dart';
import 'package:task1/provider/people_data_provider.dart';
import 'package:task1/see_all_people_page.dart';
import 'package:task1/widgets/people_card.dart';
import 'package:task1/widgets/search_bar.dart';
import 'widgets/home.dart';
import 'widgets/movies.dart';

class PeoplePage extends StatefulWidget {
  PeoplePage({Key? key}) : super(key: key);

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  void initState() {
    // TODO: implement initState
    var peopleDataProvider =
        Provider.of<PeopleDataProvider>(context, listen: false);
    peopleDataProvider.fetchPopularPeopleData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var peopleDataProvider = Provider.of<PeopleDataProvider>(context);
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                const Text(
                  'POPULAR PEOPLE',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeeAllPeoplePage(
                                itemList:
                                    peopleDataProvider.popularPeopleList)));
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(
                        color: Color(0xffa36c07), fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              // height: height,
              width: width,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 6 / 10,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  GestureDetector(
                    onTap: () {
                      peopleDataProvider
                          .getPeopleDetails(
                              peopleDataProvider.popularPeopleList[0]['id'])
                          .then((value) => peopleDataProvider.fetchPeopleImages(
                              peopleDataProvider.popularPeopleList[0]['id']))
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PeopleDetailsPage(
                                      index: 0,
                                      peopleList: peopleDataProvider
                                          .popularPeopleList))));
                    },
                    child: PeopleCard(
                        index: 0,
                        peopleList: peopleDataProvider.popularPeopleList,
                        onTap: () {}),
                  ),
                  GestureDetector(
                    onTap: () {
                      peopleDataProvider
                          .getPeopleDetails(
                              peopleDataProvider.popularPeopleList[1]['id'])
                          .then((value) => peopleDataProvider.fetchPeopleImages(
                              peopleDataProvider.popularPeopleList[1]['id']))
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PeopleDetailsPage(
                                      index: 1,
                                      peopleList: peopleDataProvider
                                          .popularPeopleList))));
                    },
                    child: PeopleCard(
                        index: 1,
                        peopleList: peopleDataProvider.popularPeopleList,
                        onTap: () {
                          peopleDataProvider.getPeopleDetails(1);
                        }),
                  ),
                  GestureDetector(
                    onTap: () {
                      peopleDataProvider
                          .getPeopleDetails(
                              peopleDataProvider.popularPeopleList[2]['id'])
                          .then((value) => peopleDataProvider.fetchPeopleImages(
                              peopleDataProvider.popularPeopleList[2]['id']))
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PeopleDetailsPage(
                                      index: 2,
                                      peopleList: peopleDataProvider
                                          .popularPeopleList))));
                    },
                    child: PeopleCard(
                        index: 2,
                        peopleList: peopleDataProvider.popularPeopleList,
                        onTap: () {
                          peopleDataProvider.getPeopleDetails(2);
                        }),
                  ),
                  GestureDetector(
                    onTap: () {
                      peopleDataProvider
                          .getPeopleDetails(
                              peopleDataProvider.popularPeopleList[3]['id'])
                          .then((value) => peopleDataProvider.fetchPeopleImages(
                              peopleDataProvider.popularPeopleList[3]['id']))
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PeopleDetailsPage(
                                      index: 3,
                                      peopleList: peopleDataProvider
                                          .popularPeopleList))));
                    },
                    child: PeopleCard(
                        index: 3,
                        peopleList: peopleDataProvider.popularPeopleList,
                        onTap: () {
                          peopleDataProvider.getPeopleDetails(3);
                        }),
                  ),
                  GestureDetector(
                    onTap: () {
                      peopleDataProvider
                          .getPeopleDetails(
                              peopleDataProvider.popularPeopleList[4]['id'])
                          .then((value) => peopleDataProvider.fetchPeopleImages(
                              peopleDataProvider.popularPeopleList[4]['id']))
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PeopleDetailsPage(
                                      index: 4,
                                      peopleList: peopleDataProvider
                                          .popularPeopleList))));
                    },
                    child: PeopleCard(
                        index: 4,
                        peopleList: peopleDataProvider.popularPeopleList,
                        onTap: () {
                          peopleDataProvider.getPeopleDetails(4);
                        }),
                  ),
                  GestureDetector(
                    onTap: () {
                      peopleDataProvider
                          .getPeopleDetails(
                              peopleDataProvider.popularPeopleList[5]['id'])
                          .then((value) => peopleDataProvider.fetchPeopleImages(
                              peopleDataProvider.popularPeopleList[5]['id']))
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PeopleDetailsPage(
                                      index: 5,
                                      peopleList: peopleDataProvider
                                          .popularPeopleList))));
                    },
                    child: PeopleCard(
                        index: 5,
                        peopleList: peopleDataProvider.popularPeopleList,
                        onTap: () {
                          peopleDataProvider.getPeopleDetails(5);
                        }),
                  )
                ],
              ),
            ),
            const Text(
              'LATEST PEOPLE',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
