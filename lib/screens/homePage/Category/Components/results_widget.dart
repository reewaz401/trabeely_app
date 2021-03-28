import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/services/tours_services.dart';
import './tour_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ResultsWidget extends StatefulWidget {
  final String destination;
  ResultsWidget(this.destination);

  @override
  _ResultsWidgetState createState() => _ResultsWidgetState();
}

class _ResultsWidgetState extends State<ResultsWidget> {
  List dataList;
  String url = 'https://api.trabeely.com/api/packages/package-tour';

  getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String _token = preferences.getString('autoSignIn');
    print("THis is a tokens $_token");
    try {
      http.Response response = await http.get(
        url,
        headers: {
          'Permission': _token,
        },
      );
      var jsonResponse = jsonDecode(response.body);
      print(
        jsonResponse,
      );
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
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : snapshot.hasData
                ? Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data['packages'].length,
                      itemBuilder: (context, index) {
                        dataList = snapshot.data['packages'];
                        return TourItem(
                          agencyName: 'Hello',
                          date: '2021-08-02 15:30',
                          destination: 'asd',
                          price: dataList[index]['price'].toDouble(),
                          title: dataList[index]['title'],
                          mainList: dataList,
                          overview: dataList[index]['overview'],
                          image: dataList[index]['packageImg'],
                          index: index,
                        );
                      },
                    ),
                  )
                : Text('No data found');
      },
    );
  }

  Future<void> fetchMethod(String type, [String destination]) async {
    if (type == 'Tours') {
      return ToursServices().fetchPacakgeList(destination);
    } else if (type == 'Hotels') {
      // return To().fetchHotelList();
    } else {
      // return ViewServices().fetchRestaurantList();
    }
  }
}
