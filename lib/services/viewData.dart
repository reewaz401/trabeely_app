import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:travel/model/toursForm.dart';
import 'package:travel/services/Api/apiAll.dart';
import 'package:http/http.dart' as http;

class ViewData with ChangeNotifier {
  ToursForm tempTours;
  List result = [];

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
      http.Response response = await http.get(
        url,
        headers: {
          'Permission': '21f@do8GP3RMISI0N-D@T@',
        },
      );
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      if (slectedType == 'Tours') {
        dataList = jsonResponse as Map<String, dynamic>;
      } else if (slectedType == 'Treks') {
        dataList = jsonResponse as Map<String, dynamic>;
      } else if (slectedType == 'Hotels') {
        dataList = jsonResponse as Map<String, dynamic>;
      } else if (slectedType == 'Restaurants') {
        dataList = jsonResponse as Map<String, dynamic>;
      }

      print(jsonResponse['packages'][0]['destination']);
      print(jsonResponse);
      var finalList = await sortByDestination(destination);
      // sortList();
      return finalList;
    } catch (error) {
      throw error;
    }
  }

  Future<List> sortByDestination([String destination]) async {
    // result.clear();

    for (int i = 0; i < 6; i++) {
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
