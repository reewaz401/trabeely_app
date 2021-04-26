import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Islogin {
  String istoken;
  Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String istoken = preferences.getString('userToken');

    return istoken;
  }
}
