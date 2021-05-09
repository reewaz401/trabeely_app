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
}
