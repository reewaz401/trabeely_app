import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/services/usernameGetter.dart';

class ProfileData extends StatefulWidget {
  @override
  _ProfileDataState createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  TextEditingController username = TextEditingController();
  String dobformattedDate;
  DateTime dob = DateTime.now();
  dateMaker(DateTime date) {
    setState(() {
      dobformattedDate = DateFormat.yMMMd().format(date);
    });
  }

  @override
  void initState() {
    getUserName().then((value) {
      setState(() {
        dobformattedDate = DateFormat.yMMMd().format(dob);
        username.text = value;
      });
    });
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
              textField('Full Name', Icons.person, username),
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
              textField('Email', Icons.email),
              textField('Phone Number', Icons.phone),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
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

Widget textField(String title, IconData icon,
    [TextEditingController controller]) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      icon: Icon(icon),
      hintText: title,
      hintStyle: TextStyle(color: Colors.grey),
    ),
  );
}
