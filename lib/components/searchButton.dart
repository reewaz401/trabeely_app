import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 70,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(15)),
      child: Text(
        'Search',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
