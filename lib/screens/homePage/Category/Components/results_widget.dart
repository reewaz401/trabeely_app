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
  String url = 'https://api.trabeely.com/api/packages';
  getData() async {
    print('Hello i am yamna');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String _token = preferences.getString('autoSignIn');
    try {
      print('Hello');
      http.Response response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $_token',
        },
      );
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      print('Hello');
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
      future: ToursServices().fetchPacakgeList(),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : snapshot.hasData
                ? Expanded(
                    child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (ctx, index) {
                          var extData = snapshot.data['packages'][index];
                          return TourItem(
                            agencyName: extData['destination'],
                            date: '2021-08-02 15:30',
                            title: extData['title'],
                            destination: extData['destination'],
                            price: 1500,
                          );
                        }),
                  )
                : Center(
                    child: Text('No data found',
                        style: TextStyle(color: Colors.grey)));
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
