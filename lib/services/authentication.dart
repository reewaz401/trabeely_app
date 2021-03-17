import 'dart:convert';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Api/authApi.dart';
import '../model/SignupForm.dart';
import 'package:http/http.dart' as http;
import '../model/httpExecption.dart' as exp;

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  bool get isAuth {
    return token != null;
  }

  String get userId {
    return _userId;
  }

  String get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  Future<void> signIn(String email, String password) async {
    final url = signinApi;
    try {
      final response = await http.post(url, body: {
        'email': email,
        'password': password,
      });
      print(response.body);
      if (json.decode(response.body)['success'] == false) {
        throw exp.HttpException(json.decode(response.body)["message"]);
      }
      _token = json.decode(response.body)["user"]["token"];
      _userId = json.decode(response.body)["user"]["name"];
      if (_token != null) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('autoSignIn', _token);
      }
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signUp(SignupForm newForm) async {
    final url = signupApi;
    try {
      final response = await http.post(url, body: {
        'fullname': newForm.fullName,
        'contact': newForm.contactNumber,
        'address': newForm.address,
        'email': newForm.email,
        'password': newForm.password,
      });
      if (json.decode(response.body)['success'] == false) {
        throw exp.HttpException(json.decode(response.body)["message"]);
      }
    } catch (error) {
      throw error;
    }
  }
}
