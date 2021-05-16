import 'package:flutter/material.dart';

Widget textField(
    {String title, IconData icon, TextEditingController controller}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blueAccent)),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            icon: Icon(icon),
            hintText: title,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      SizedBox(
        height: 25,
      )
    ],
  );
}
