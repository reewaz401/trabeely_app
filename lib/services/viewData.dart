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
//  Map<String, dynamic> finalList = {"data": []};

  Future<dynamic> viewData(String selectedType,
      [String destination, bool isInitial = false]) async {
    String url;
    if (destination != null) {
      print('Enter by destinaiton');
      url = '$viewByDestinationApi$destination';
      response = await http.post(url, headers: {
        'Permission': '21f@do8GP3RMISI0N-D@T@',
      }, body: {
        "type": selectedType
      });
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } else {
      if (selectedType == 'Tours') {
        url = viewToursApi;
      } else if (selectedType == 'Treks') {
        url = viewTreksApi;
      } else if (selectedType == 'Hotels') {
        url = viewHotelsApi;
      } else if (selectedType == 'Restaurants') {
        url = viewRestaurantsApi; //api for restaurant
      }

      try {
        if (selectedType == 'Hotels') {
          print('Hotels Enter');
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          final String autoToken = prefs.getString('autoSignIn');
          print("token : $autoToken");
          response = await http.get(
            url,
            headers: {
              HttpHeaders.authorizationHeader:
                  "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDYwNmJhODMwZGEwMDBjOTQzNmNiMTMiLCJhY2Nlc3NMZXZlbCI6InN1cGVyLWFkbWluLXNjb3V0IiwiaWF0IjoxNjE3ODc3MDgzLCJleHAiOjE2MTc5NjM0ODN9.3sd0vSVnTCNLOnIXz7p3Zo2vabDxDQVodvJ8iqPfpqs",
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

        if (selectedType == 'Tours') {
          dataList = jsonResponse as Map<String, dynamic>;
        } else if (selectedType == 'Treks') {
          dataList = jsonResponse as Map<String, dynamic>;
        } else if (selectedType == 'Hotels') {
          dataList = jsonResponse as Map<String, dynamic>;
        } else if (selectedType == 'Restaurants') {
          dataList = jsonResponse as Map<String, dynamic>;
        }
        print(jsonResponse);
        print("Destination: $destination");

        return jsonResponse;
      } catch (error) {
        print(error);
        throw error;
      }
    }
  }

  /*Future<Map<String, dynamic>> sortByDestination(
    String destination,
  ) async {
    // result.clear();

    for (int i = 0; i < dataList['data'].toList().length; i++) {
      var data = dataList['data'][i]['destination'];
      if (data.toLowerCase() == destination.toLowerCase()) {
        print('sortByDestinaiton');
        finalList['packages'].add(dataList['packages'][i]);
      }
    }
    print('object');
    print(finalList);
    return finalList;
  }*/
}
