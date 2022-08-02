import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/people_details_page.dart';

import '../provider/people_data_provider.dart';

class PeopleCard extends StatelessWidget {
  int index;
  List peopleList;
  Function onTap;
  PeopleCard(
      {required this.index, required this.peopleList, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var peopleDataProvider = Provider.of<PeopleDataProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
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
                        'https://image.tmdb.org/t/p/original${peopleList[index]['profile_path']}'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: width * .4,
            child: Text(
              '${peopleList[index]['name']}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
