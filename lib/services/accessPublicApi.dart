import 'dart:convert';

import 'package:http/http.dart' as http;

getPublicDataApi(url) async {
  try {
    final response = await http.get(
      'https://api.trabeely.com/api/story/getpost',
      headers: {
        'Permission': '21f@do8GP3RMISI0N-D@T@',
      },
    );

    var jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  } catch (e) {
    print(e);
  }
}
