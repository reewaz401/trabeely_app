import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  String userName;
  String email;
  Future<String> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String userName = preferences.getString('userId');
    return userName;
  }

  Future<String> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String userName = preferences.getString('email');
    return userName;
  }

  Future<String> getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String id = preferences.getString('id');
    return id;
  }

  Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String token = preferences.getString('userToken');
    return token;
  }

  Future<String> getCookie() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String cookie = preferences.getString('cookie');
    return cookie;
  }

  Future<String> getServer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String server = preferences.getString('server');
    return server;
  }
}
