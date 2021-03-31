import 'dart:convert';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/tabsScreen/tabs_screen.dart';
import './Api/apiAll.dart';
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

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    print(email);
    print(password);
    final url = signinApi;
    try {
      final response = await http.post(url, body: {
        'email': email,
        'password': password,
      });
      print(response.headers['set-cookie']);
      if (json.decode(response.body)['success'] == false) {
        throw exp.HttpException(json.decode(response.body)["message"]);
      }

      _token = json.decode(response.body)["user"]["token"];
      _userId = json.decode(response.body)["user"]["name"];
      print(response.headers['server']);
      if (_token != null) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('userToken', _token);
        preferences.setString('itemDisplayToken', '21f@do8GP3RMISI0N-D@T@');
        preferences.setString('username', _userId);
        preferences.setString('cookie', response.headers['set-cookie']);
        preferences.setString('server', response.headers['server']);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => TabsScreen()));
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

  void logOut() async {
    http.post(logOutApi);

    _token = null;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('autoSignIn', null);
    preferences.setString('username', null);
    notifyListeners();
  }
}
