import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/homePage/components/card.dart';
import 'package:http/http.dart' as http;
import 'package:travel/services/urls.dart';

class toursCard extends StatefulWidget {
  @override
  _toursCardState createState() => _toursCardState();
}

class _toursCardState extends State<toursCard> {
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
              cityName: 'Pokhara',
              country: 'Nepal',
              image: 'pokhara',
              des: 'We an go all out',
            ),
            DestinationCarousel(
              activites: 'Trek',
              cityName: 'Mustang',
              country: 'Nepal',
              image: 'mustang',
              des: 'We an go all out',
            ),
            DestinationCarousel(
              activites: 'Trek',
              cityName: 'Tapelejung',
              country: 'Nepal',
              image: 'taplejung',
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
