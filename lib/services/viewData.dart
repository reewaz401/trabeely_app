import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel/model/toursForm.dart';
import 'package:travel/services/Api/apiAll.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/services/themeData.dart';

class ViewData with ChangeNotifier {
  ToursForm tempTours;
  Map<String, dynamic> result = {'data': []};

  Map<String, dynamic> dataList;
  dynamic jsonResponse;

  Future<dynamic> viewData(
    String slectedType, [
    String destination,
    int startPriceRange,
    int endPriceRange,
  ]) async {
    String url;
    if (slectedType == 'Tours') {
      url = viewToursApi;
    } else if (slectedType == 'Treks') {
      url = viewTreksApi;
    } else if (slectedType == 'Hotels') {
      url = viewHotelsApi;
    } else if (slectedType == 'Restaurants') {
      url = viewRestaurantsApi; //api for restaurant
    } else if (slectedType == 'Weekends') {
      url = viewWeekendsApi; //api for restaurant
    }

    try {
      final response = await http.get(
        url,
        headers: {
          'Permission': '21f@do8GP3RMISI0N-D@T@',
        },
      );

      jsonResponse = jsonDecode(response.body);

      dataList = jsonResponse as Map<String, dynamic>;
      // if (slectedType == 'Tours') {
      //   dataList = jsonResponse as Map<String, dynamic>;
      // } else if (slectedType == 'Treks') {
      //   dataList = jsonResponse as Map<String, dynamic>;
      // } else if (slectedType == 'Hotels') {
      //   dataList = jsonResponse as Map<String, dynamic>;
      // } else if (slectedType == 'Restaurants') {
      //   dataList = jsonResponse as Map<String, dynamic>; //api for restaurant
      // }

      if (destination == '') {
        destination = null;
      }

      if (destination != null) {
        jsonResponse = await sortByDestination(
            destination: destination, length: dataList['data'].length);
        if (startPriceRange > 0 || endPriceRange > 0) {
          jsonResponse = await sortByPriceRange(
              startPriceRange, endPriceRange, jsonResponse['data'].length);
        }

        return jsonResponse;
      } else if (destination == null || destination == '') {
        if (startPriceRange > 0 || endPriceRange > 0) {
          jsonResponse = await sortByPriceRange(
              startPriceRange, endPriceRange, jsonResponse['data'].length);
        }

        return jsonResponse;
      } else {
        print('snull des');
        return null;
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<Map<String, dynamic>> sortByDestination(
      {String destination, int length, int startPrice, int endPrice}) async {
    // result.clear();

    for (int i = 0; i < length; i++) {
      var data = dataList['data'][i]['destination'];
      if (data.toLowerCase() == destination.toLowerCase()) {
        print('sortByDestinaiton');

        result['data'].add(dataList['data'][i]);
      }
    }

    return result;
  }

  sortByPriceRange(int start, int end, int length) async {
    print('sort by price');
    result = {'data': []};
    for (int i = 0; i < length; i++) {
      var priceData = jsonResponse['data'][i]['price'];
      if (priceData >= start && priceData <= end) {
        print('sortByprice');
        result['data'].add(dataList['data'][i]);
      }
    }
    print('reslut pri');
    print(result);
    return result;
  }
}
