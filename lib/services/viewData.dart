import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel/model/toursForm.dart';
import 'package:travel/services/Api/apiAll.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ViewData with ChangeNotifier {
  ToursForm tempTours;
  Map<String, dynamic> result = {'data': []};
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
        final String autoToken = prefs.getString('userToken');
        print("token : $autoToken");
        response = await http.get(
          url,
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $autoToken",
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
        jsonResponse =
            await sortByDestination(destination, dataList['data'].length);
      }
      print("Destination: $destination");

      return jsonResponse;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<Map<String, dynamic>> sortByDestination(
      String destination, int length) async {
    // result.clear();

    for (int i = 0; i < length; i++) {
      var data = dataList['data'][i]['destination'];
      if (data.toLowerCase() == destination.toLowerCase()) {
        print('sortByDestinaiton');

        result['data'].add(dataList['data'][i]);
        return result;
      }
    }
    return result;
  }
}
