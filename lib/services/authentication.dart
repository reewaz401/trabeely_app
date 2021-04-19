import 'dart:convert';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/FirstScreen/one.dart';
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
            context,
            MaterialPageRoute(
                builder: (ctx) => TabsScreen(
                      'Search Destinaiton',
                    )));
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

  Future<void> logOut(BuildContext context) async {
    await http.post(logOutApi);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(preferences.getString('userToken'));
    preferences.setString('userToken', null);
    preferences.setString('username', null);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => OneScreen()));
  }

  Future<void> book() async {
    final response = await http.post(
      "https://api.trabeely.com/api/booking/add-booking",
      headers: {
        "Authorization": "Bearer $_token",
        "content-type": "application/json",
      },
      body: json.encode({
        "type": "Trek",
        "agent_id": "603375168652600a34cd1b1a",
        "package_id": "60520e4d9359244a2f4d32d7",
        "bookDate": "11/11/2021",
        "child": 5,
        "adult": 90,
      }),
    );
  }
}
