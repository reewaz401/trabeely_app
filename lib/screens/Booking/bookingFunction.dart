import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future createBooking(String type) async {
  String maintype = type;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String _token = preferences.getString('userToken');
  String _cookie = preferences.getString('cookie');
  String _server = preferences.getString('server');
  try {
    if (type == 'Trek') {
      var response = await http.post(
        'https://api.trabeely.com/api/booking/add-booking',
        headers: {
          'Authorization': 'Bearer $_token',
          'content-type': 'application/json; charset=utf-8',
          'Cookie': _cookie,
          'Server': _server
        },
        body: jsonEncode(
          {
            "type": "Trek",
            "agent_id": "603375168652600a34cd1b1a",
            "package_id": "605401f2ffe9af1734132c91",
            "bookDate": "11/11/2021",
            "child": 1555,
            "adult": 55,
          },
        ),
      );
      var booking_status = json.decode(response.body)['success'];
      return booking_status;
    }
    if (type == 'Travel') {
      var response = await http.post(
        'https://api.trabeely.com/api/booking/add-booking',
        headers: {
          'Authorization': 'Bearer $_token',
          'content-type': 'application/json; charset=utf-8',
          'Cookie': _cookie,
          'Server': _server
        },
        body: jsonEncode(
          {
            "type": "Trek",
            "agent_id": "603375168652600a34cd1b1a",
            "package_id": "605401f2ffe9af1734132c91",
            "bookDate": "11/11/2021",
            "child": 1555,
            "adult": 55,
            "bookType": 'Urgent'
          },
        ),
      );
      var booking_status = json.decode(response.body)['success'];
      return booking_status;
    } else if (type == 'Club') {
      var response = await http.post(
        'https://api.trabeely.com/api/booking/add-booking',
        headers: {
          'Authorization': 'Bearer $_token',
          'content-type': 'application/json; charset=utf-8',
          'Cookie': _cookie,
          'Server': _server
        },
        body: jsonEncode(
          {
            "type": "Trek",
            "agent_id": "603375168652600a34cd1b1a",
            "package_id": "605401f2ffe9af1734132c91",
            "bookDate": "11/11/2021",
            "child": 1555,
            "adult": 55,
          },
        ),
      );
    } else if (type == 'Club') {
      var response = await http.post(
        'https://api.trabeely.com/api/booking/add-booking',
        headers: {
          'Authorization': 'Bearer $_token',
          'content-type': 'application/json; charset=utf-8',
          'Cookie': _cookie,
          'Server': _server
        },
        body: jsonEncode(
          {
            "type": "Trek",
            "agent_id": "603375168652600a34cd1b1a",
            "package_id": "605401f2ffe9af1734132c91",
            "bookDate": "11/11/2021",
            "numberOfPeople": 55,
          },
        ),
      );
      var booking_status = json.decode(response.body)['success'];
      return booking_status;
    }
  } catch (e) {
    print(e);
  }
}
