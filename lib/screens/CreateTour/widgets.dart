import 'package:flutter/material.dart';

Widget inputfield(TextEditingController controller, TextInputType texttype) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: controller,
      keyboardType: texttype,
      decoration: InputDecoration(
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    ),
  );
}

Widget headingText(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    ),
  );
}

Widget subheading(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
