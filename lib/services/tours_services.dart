import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:travel/services/Api/apiAll.dart';

class User {
  final String name;
  const User({this.name});
  static User fromJson(json) {
    print('object');
    print(json);
    return User(name: json['destination']);
  }
}

class UserApi {
  static Future<List<User>> getSuggestion(String query) async {
    final response = await http.get(
      viewToursApi,
      headers: {
        'Permission': '21f@do8GP3RMISI0N-D@T@',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> users = json.decode(response.body)['data'];
      return users.map((json) => User.fromJson(json)).where((user) {
        final nameLower = user.name.toLowerCase();
        final queryLower = query.toLowerCase();
        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
// class UserApi {
//   static Future<List<User>> getSuggestion(String query) async {
//     final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final List users = json.decode(response.body);
//       print(users);
//       return users.map((json) => User.fromJson(json)).where((user) {
//         final nameLower = user.name.toLowerCase();
//         final queryLower = query.toLowerCase();
//         return nameLower.contains(queryLower);
//       }).toList();
//     } else {
//       throw Exception();
//     }
//   }
// }
