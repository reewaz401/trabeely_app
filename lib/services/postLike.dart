import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class PostLike {
  Future<void> postLike(id, bool islike) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String _token = preferences.getString('userToken');
    String _cookie = preferences.getString('cookie');
    String _server = preferences.getString('server');

    var res = await http.post(
      'https://api.trabeely.com/api/story/dolike',
      body: json.encode(
        {
          'post_id': id,
          "user_id": "604ece1abfbaac3c7c5a9630",
          "isLike": islike,
        },
      ),
      headers: {
        'Authorization': 'Bearer $_token',
        'content-type': 'application/json; charset=utf-8',
        'Cookie': _cookie,
        'Server': _server
      },
    );
    print(res.body);
  }
}
