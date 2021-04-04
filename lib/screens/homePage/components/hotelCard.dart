import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/homePage/components/card.dart';
import 'package:http/http.dart' as http;
import 'package:travel/services/urls.dart';

class hotelCard extends StatefulWidget {
  @override
  _hotelCardState createState() => _hotelCardState();
}

class _hotelCardState extends State<hotelCard> {
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
              cityName: 'Mystic Mountain',
              country: 'Nepal',
              image: 'mystic',
              des: 'We an go all out',
            ),
            DestinationCarousel(
              activites: 'Trek',
              cityName: 'Annapurna',
              country: 'Nepal',
              image: 'anna',
              des: 'We an go all out',
            ),
            DestinationCarousel(
              activites: 'Trek',
              cityName: 'Bisauni',
              country: 'Nepal',
              image: 'bisauni',
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
