import 'package:flutter/material.dart';
import 'package:travel/screens/FirstScreen/SlideTile.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int slideIndex = 0;
  PageController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SlideTile(slideIndex),
      ),
    );
  }
}
