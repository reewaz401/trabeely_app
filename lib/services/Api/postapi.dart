import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

postApi(url, postBody) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String _token = preferences.getString('userToken');
  String _cookie = preferences.getString('cookie');
  String _server = preferences.getString('server');
  try {
    var res = await http.post(
      url,
      body: postBody,
      headers: {
        'Authorization': 'Bearer $_token',
        'content-type': 'application/json; charset=utf-8',
        'Cookie': _cookie,
        'Server': _server
      },
    );
    Map<String, dynamic> map = json.decode(res.body);

    List<dynamic> data = map['data'];
    return data;
  } catch (e) {
    print(e);
  }
}
