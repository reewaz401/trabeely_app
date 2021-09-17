import 'package:shared_preferences/shared_preferences.dart';

Future<String> getUsername() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('userId');
}

Future<String> getUserToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('userToken');
}
