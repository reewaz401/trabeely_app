import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/homePage/components/card.dart';
import 'package:http/http.dart' as http;
import 'package:travel/services/urls.dart';

class HomepageCard extends StatefulWidget {
  @override
  _HomepageCardState createState() => _HomepageCardState();
}

class _HomepageCardState extends State<HomepageCard> {
  List dataList;

  String url = tourUrl;

  getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String _token = preferences.getString('itemDisplayToken');
    print(_token);
    print(url);
    try {
      http.Response response = await http.get(
        url,
        headers: {
          'Permission': _token,
        },
      );
      var jsonResponse = jsonDecode(response.body);
      print(
        jsonResponse.length,
      );
      dataList = jsonResponse;
      return jsonResponse;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DestinationCarousel(
              activites: 'Trek',
              cityName: 'Annapurna',
              country: 'Nepal',
              image: 'anna1',
              des: 'We an go all out',
            ),
            DestinationCarousel(
              activites: 'Trek',
              cityName: 'Everest',
              country: 'Nepal',
              image: 'anna2',
              des: 'We an go all out',
            ),
            DestinationCarousel(
              activites: 'Trek',
              cityName: 'Mardi',
              country: 'Nepal',
              image: 'anna3',
              des: 'We an go all out',
            ),
          ],
        ),
      ),
    );
  }
}

// DestinationCarousel(
//               activites: 'Trek',
//               cityName: 'Mardi',
//               country: 'Nepal',
//               image: 'anna1',
//               des: 'We an go all out',
//             ),
