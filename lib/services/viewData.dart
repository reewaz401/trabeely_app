import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:travel/services/Api/apiAll.dart';
import 'package:http/http.dart' as http;

class ViewData with ChangeNotifier {
  Future<dynamic> viewData(String slectedType) async {
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
      return jsonResponse;
    } catch (error) {
      throw error;
    }
  }
}
