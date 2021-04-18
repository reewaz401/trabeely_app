import 'package:shared_preferences/shared_preferences.dart';

String userName;
Future<String> getUserName() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final String userName = preferences.getString('username');
  return userName;
}
