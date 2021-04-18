import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/services/usernameGetter.dart';

class ProfileData extends StatefulWidget {
  @override
  _ProfileDataState createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  TextEditingController username = TextEditingController();
  @override
  void initState() {
    getUserName().then((value) {
      setState(() {
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
            children: [
              textField('Full Name', Icons.person, username),
              textField('Date Of Birth', Icons.calendar_today_outlined),
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
