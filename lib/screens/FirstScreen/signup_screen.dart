import 'package:flutter/material.dart';
import 'package:travel/screens/FirstScreen/SlideTile.dart';

class SignUpScreen extends StatefulWidget {
  final bool isBack;
  SignUpScreen({this.isBack});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int slideIndex = 0;
  PageController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isBack ? AppBar() : null,
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SlideTile(slideIndex),
      ),
    );
  }
}
