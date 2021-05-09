import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

putData({url, name, email, password}) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String _token = preferences.getString('userToken');
  String _userId = preferences.getString('id');
  String _cookie = preferences.getString('cookie');
  String _server = preferences.getString('server');
  print(_userId);

  try {
    print('Hello');
    http.Response response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $_token',
        'Cookie': _cookie,
        'Server': _server
      },
      body: {
        "_id": _userId,
        "email": email,
        "password": "hello",
        "contact": "9860203881",
        "address": "Kathmandu",
        "country": "Nepal",
        "fullname": name,
      },
    );
    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse['success']) {
      preferences.setString('username', name);
    }
    return jsonResponse;
  } catch (e) {
    print(e);
  }
}
