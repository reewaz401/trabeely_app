import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

putData(url, body) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String _token = preferences.getString('userToken');
  String _userId = preferences.getString('id');
  String _cookie = preferences.getString('cookie');
  String _server = preferences.getString('server');
  print(body);

  try {
    print('Hello');
    http.Response response = await http.put(url,
        headers: {
          'Authorization': 'Bearer $_token',
          'Cookie': _cookie,
          'Server': _server,
          'content-type': 'application/json; charset=utf-8',
        },
        body: body);
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    return jsonResponse;
    return jsonResponse;
  } catch (e) {
    print(e);
  }
}
