import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel/services/Api/viewApi.dart';
import '../model/toursForm.dart';
import 'package:http/http.dart' as http;
import '../model/httpExecption.dart' as exp;

class ToursServices with ChangeNotifier {
  List<ToursForm> tourList = [];
  http.Response response;

  Future<void> fetchPacakgeList([String destination]) async {
    try {
      print('StartFetch');
      if (destination.isEmpty) {
        print('destination null');
        response = await http.get(viewToursApi);
      } else {
        print(destination);
        response = await http.get('$viewToursApi/destination/$destination');
      }
      final extractedInfo = json.decode(response.body);
      if (extractedInfo['packages'] == null) {
        print('No data');
        return;
      }
      print(extractedInfo);
      return extractedInfo;
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
