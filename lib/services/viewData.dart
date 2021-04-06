import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel/model/toursForm.dart';
import 'package:travel/services/Api/apiAll.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ViewData with ChangeNotifier {
  ToursForm tempTours;
  dynamic result = [];
  http.Response response;

  Map<String, dynamic> dataList;
  Future<dynamic> viewData(String slectedType,
      [String destination, bool isInitial = false]) async {
    String url;
    if (slectedType == 'Tours') {
      url = viewToursApi;
    } else if (slectedType == 'Treks') {
      url = viewTreksApi;
    } else if (slectedType == 'Hotels') {
      url = viewHotelsApi;
    } else if (slectedType == 'Restaurants') {
      url = viewRestaurantsApi; //api for restaurant
    }

    try {
      if (slectedType == 'Hotels') {
        print('Hotels Enter');
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String autoToken = prefs.getString('autoSignIn');
        print("token : $autoToken");
        response = await http.get(
          url,
          headers: {
            HttpHeaders.authorizationHeader:
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDRlY2UxYWJmYmFhYzNjN2M1YTk2MzAiLCJhY2Nlc3NMZXZlbCI6InN1cGVyLWFkbWluLXNjb3V0IiwiaWF0IjoxNjE3NjgyMzg2LCJleHAiOjE2MTc3Njg3ODZ9.SBMq5M8_UhdiUwX52NPIRoizDrKQuNFouJst6NqG9J0",
          },
        );
        print(jsonDecode(response.body));
      } else {
        response = await http.get(
          url,
          headers: {
            'Permission': '21f@do8GP3RMISI0N-D@T@',
          },
        );
      }

      var jsonResponse = jsonDecode(response.body);

      if (slectedType == 'Tours') {
        dataList = jsonResponse as Map<String, dynamic>;
      } else if (slectedType == 'Treks') {
        dataList = jsonResponse as Map<String, dynamic>;
      } else if (slectedType == 'Hotels') {
        dataList = jsonResponse as Map<String, dynamic>;
      } else if (slectedType == 'Restaurants') {
        dataList = jsonResponse as Map<String, dynamic>;
      }

      print("Destination: $destination");
      if (destination != null) {
        print('Enter by destinaiton');
        jsonResponse = await sortByDestination(destination, jsonResponse);

        return jsonResponse;
      }

      return jsonResponse;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<List> sortByDestination(String destination, dynamic length) async {
    // result.clear();

    for (int i = 0; i < 1; i++) {
      var data = dataList['packages'][i]['destination'];
      if (data.toLowerCase() == destination.toLowerCase()) {
        print('sortByDestinaiton');

        result.add(dataList['packages'][i]);
        return result;
      }
    }
    return null;
  }
}
