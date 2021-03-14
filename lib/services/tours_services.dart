import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel/services/Api/viewApi.dart';
import '../model/toursForm.dart';
import 'package:http/http.dart' as http;
import '../model/httpExecption.dart' as exp;

class ToursServices with ChangeNotifier {
  List<ToursForm> tourList = [];

  Future<void> fetchPacakgeList([String destination]) async {
    try {
      final response = await http.get(viewToursApi);
      final extractedInfo = json.decode(response.body);

      if (extractedInfo['packages'] == null) {
        print('No data');
        return;
      }
      //tourList = extractedInfo['packages'];
      print(extractedInfo);
      return extractedInfo; //tourList;
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
