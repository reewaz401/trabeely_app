import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel/services/Api/apiAll.dart';

import '../model/toursForm.dart';
import 'package:http/http.dart' as http;

class ToursServices with ChangeNotifier {
  List<ToursForm> tourList = [];

  Future<void> fetchPacakgeList([String destination]) async {
    String _token;
    List itemList;
    String url = 'https://api.trabeely.com/api/packages';
    getData() async {
      String basicAuth = 'Basic ' +
          base64Encode(
            utf8.encode(_token),
          );
      try {
        http.Response response = await http.get(
          url,
          headers: {
            'Authorization': 'Bearer $_token',
          },
        );
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      } catch (e) {
        print(e);
      }
    }
  }
}
