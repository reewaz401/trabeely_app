import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

createCustomBooking() async {
  print('Entered');
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String _token = preferences.getString('userToken');
  String _cookie = preferences.getString('cookie');
  String _server = preferences.getString('server');
  print(_token + _cookie + _server);
  try {
    print('Trying');
    var response = await http.post(
      'https://api.trabeely.com/api/booking/custom-booking',
      headers: {
        'Authorization': 'Bearer $_token',
        'content-type': 'application/json; charset=utf-8',
        'Cookie': _cookie,
        'Server': _server
      },
      body: jsonEncode(
        {
          "hotel": "3 star",
          "from": "Bhaktapur",
          "to": "Kathmandu",
          "dateFrom": "11/11/2021",
          "dateTo": "11/20/2021",
          "contact": "1111111",
          "totalPeople": "4",
          "duration": "3",
          "transportation": "Jeep",
          "transportationType": "One Way",
          "extraNeed": "fruits bringing",
          "isInstution": false,
          "iName": "School Test",
          "iLocation": "Imadol",
          "iContact": "7856235569",
          "iEmail": "rr@gmail.com"
        },
      ),
    );
    print(response.body);
    var bookingStatus = json.decode(response.body)['success'];

    return bookingStatus;
  } catch (e) {
    print(e);
  }
}
