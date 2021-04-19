import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/Booking/bookinginfoDisplay.dart';
import 'package:travel/screens/CreateTour/widgets.dart';

class QrScanned extends StatefulWidget {
  String qrCodeResult;
  QrScanned(this.qrCodeResult);

  @override
  _QrScannedState createState() => _QrScannedState();
}

class _QrScannedState extends State<QrScanned> {
  Map<String, dynamic> userdatas;

  Future userData(String qrCodeResult) async {
    try {
      String url = 'https://api.trabeely.com/api/users';

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String autoToken = prefs.getString('userToken');
      print("token : $autoToken");
      var response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $autoToken",
        },
      );

      var jsonResponse = jsonDecode(response.body);
      for (int i = 0; i <= jsonResponse.length; i++) {
        if (qrCodeResult == jsonResponse['users'][i]['_id']) {
          print('found' * 10000);
          var returner = jsonResponse['users'][i];
          return returner;
        } else {}
      }
      var returner = jsonResponse['users'][0];

      return null;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    userData(widget.qrCodeResult).then((value) {
      setState(() {
        userdatas = Map<String, dynamic>.from(value);

        print(userdatas['_id']);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Column(children: [
            FutureBuilder(
                future: userData(widget.qrCodeResult),
                builder: (context, snap) {
                  return snap.hasData
                      ? Column(
                          children: [
                            CircleAvatar(
                              child: Text('Y'),
                            ),
                            heading(userdatas['fullname']),
                            subheading(userdatas['email']),
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                }),
            // ElevatedButton(
            //     onPressed: () => userData('qrCodeResult'), child: Text('asd'))
          ]),
        ),
      ),
    );
  }
}
