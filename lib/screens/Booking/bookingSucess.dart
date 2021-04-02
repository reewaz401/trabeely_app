import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/model/Booking/booking.dart';
import 'package:travel/screens/tabsScreen/tabs_screen.dart';
import 'package:travel/services/urls.dart';
import 'dart:io';

class BookingConfirm extends StatefulWidget {
  final int child;
  final int adult;
  final int room;
  final String payment;
  BookingConfirm({this.adult, this.child, this.room, this.payment});

  @override
  _BookingConfirmState createState() => _BookingConfirmState();
}

class _BookingConfirmState extends State<BookingConfirm> {
  Future createBooking() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String _token = preferences.getString('userToken');
    String _cookie = preferences.getString('cookie');
    String _server = preferences.getString('server');
    try {
      var response = await http.post(
        'https://api.trabeely.com/api/booking/add-booking',
        headers: {
          'Authorization': 'Bearer $_token',
          'content-type': 'application/json; charset=utf-8',
          'Cookie': _cookie,
          'Server': _server
        },
        // headers: {
        //   'Authorization': Bearer $_token',
        //   'content-type': 'application/json; charset=utf-8'
        // },
        body: jsonEncode({
          "type": "Trek",
          "agent_id": "603375168652600a34cd1b1a",
          "package_id": "605401f2ffe9af1734132c91",
          "bookDate": "11/11/2021",
          "child": 1555,
          "adult": 55,
        }),
      );
      var booking_status = json.decode(response.body)['success'];
      return booking_status;
    } catch (e) {
      print(e);
    }
  }

  // int child = 18;

  // int adult = 15;
  // Future<http.Response> createBooking() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String _token = preferences.getString('userToken');
  //   print(_token);
  //   try {
  //     print('Tried ');
  //     return http.post(
  //       (Uri.https(
  //         'api.trabeely.com',
  //         'api/booking/add-booking',
  //       )),
  //
  //     );
  //   } catch (e) {
  //     print(e);
  //     return e;
  //   }
  // }

  bool _success = false;
  @override
  Widget build(BuildContext context) {
    print(widget.adult);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      doubleRow('Destination', 'Annapurna'),
                      doubleRow('Adult', widget.adult.toString()),
                      doubleRow('Child', widget.child.toString()),
                      doubleRow('Room', widget.room.toString()),
                      doubleRow('Price', '500'),
                      doubleRow('Payment Method', widget.payment),
                      doubleRow('Total People',
                          (widget.adult + widget.child).toString()),
                      doubleRow('Total Price', '250000'),
                      SizedBox(
                        height: 50,
                      ),
                      RaisedButton(
                        onPressed: () async {
                          setState(() {
                            _success = true;
                          });
                          var status = await createBooking();
                          CoolAlert.show(
                            onConfirmBtnTap: () {
                              print('Pushed');
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return TabsScreen('Search Destination');
                                },
                              ));
                            },
                            context: context,
                            barrierDismissible: false,
                            type: status
                                ? CoolAlertType.success
                                : CoolAlertType.error,
                            text: status
                                ? "Transaction completed successfully!"
                                : "Try Again",
                          );
                        },
                        child: Text('Submit'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget doubleRow(String firstitem, String seconditem) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: width * 0.4,
              child: Text(
                firstitem,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(width: width * 0.4, child: Text(seconditem)),
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
