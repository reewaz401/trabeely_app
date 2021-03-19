import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel/services/Api/apiAll.dart';
import '../model/toursForm.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/httpExecption.dart' as exp;

class ToursServices with ChangeNotifier {
  List<ToursForm> tourList = [];

  Future<void> fetchPacakgeList([String destination]) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String validToken = prefs.getString('autoSignIn');
      print(validToken);
      final response = await http.get(
        viewToursApi,
        headers: {'Authorization': 'Bearer $validToken'},
      );
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
