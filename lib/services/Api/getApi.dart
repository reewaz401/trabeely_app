import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

getApiData(url) async {
  print('a');
  try {
    final response = await http.get(
      url,
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
