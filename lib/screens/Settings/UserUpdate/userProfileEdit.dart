import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/services/Api/apiputdata.dart';
import 'package:travel/services/usernameGetter.dart';
import 'package:travel/services/Api/apiAll.dart';
import 'package:travel/widget/textField.dart';

class ProfileData extends StatefulWidget {
  @override
  _ProfileDataState createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController contactNum = TextEditingController();

  String dobformattedDate;
  DateTime dob = DateTime.now();
  dateMaker(DateTime date) {
    setState(() {
      dobformattedDate = DateFormat.yMMMd().format(date);
    });
  }

  setup() async {
    dobformattedDate = DateFormat.yMMMd().format(dob);
    username.text = await UserInfo().getUserName();
    userEmail.text = await UserInfo().getEmail();
  }

  @override
  void initState() {
    setState(() {
      setup();
    });
    print(userEmail.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textField(
                  title: 'Full Name', icon: Icons.person, controller: username),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime(1980),
                              firstDate: DateTime(1980),
                              lastDate: DateTime(2020))
                          .then((value) {
                        print(value);
                        dateMaker(value);
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.date_range),
                            Text(dobformattedDate.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
              textField(
                  title: 'Email', icon: Icons.email, controller: userEmail),
              textField(
                  title: 'Phone Number',
                  icon: Icons.phone,
                  controller: contactNum),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    String _token = preferences.getString('userToken');
                    String _userId = preferences.getString('id');
                    String _cookie = preferences.getString('cookie');
                    String _server = preferences.getString('server');
                    var res = await putData(
                        updateProfileAPi,
                        json.encode({
                          "_id": _userId,
                          "email": userEmail.text,
                          "contact": 3453453,
                          "address": "Nepal",
                          "country": "Nepal",
                          "fullname": username.text,
                        }));
                    print(res);
                    if (res['success']) {
                      preferences.setString('userId', username.text);
                    }
                  },
                  child: Text('Update'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
