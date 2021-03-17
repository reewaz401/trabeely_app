import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/toursForm.dart';
import 'package:http/http.dart' as http;
import '../model/httpExecption.dart' as exp;

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
  }
}
