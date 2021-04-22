import 'dart:convert';

import 'package:flutter/src/widgets/editable_text.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future createCustomBooking(
    {String hotel,
    TextEditingController destinationfromName,
    TextEditingController destinationToName,
    String initformattedDate,
    String finalformattedDate,
    TextEditingController totalPeople,
    String vehicle,
    String transportationway,
    TextEditingController additionalInfo,
    bool isinstitution,
    String instituionalname,
    String institutionalLocation,
    String instituitonContact,
    String instituionalemail}) async {
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
        // 'Authorization': 'Bearer $_token',
        // 'content-type': 'application/json; charset=utf-8',
        // 'Cookie': _cookie,
        // 'Server': _server
      },
      body: jsonEncode(
        {
          "hotel": hotel,
          "from": destinationfromName,
          "to": destinationToName,
          "dateFrom": initformattedDate,
          "dateTo": finalformattedDate,
          "contact": "1111111",
          "totalPeople": totalPeople,
          "duration": "3",
          "transportation": vehicle,
          "transportationType": transportationway,
          "extraNeed": additionalInfo,
          "isInstution": isinstitution,
          "iName": instituionalname,
          "iLocation": institutionalLocation,
          "iContact": instituitonContact,
          "iEmail": instituionalemail
        },
      ),
    );

    var bookingStatus = json.decode(response.body)['success'];
    print(bookingStatus);
    return bookingStatus;
  } catch (e) {
    print(e);
  }
}
