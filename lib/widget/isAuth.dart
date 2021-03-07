import 'package:flutter/material.dart';
import '../screens/tabs_screen.dart';
import '../screens/authForm_widget.dart';
import 'package:provider/provider.dart';
import '../services/authentication.dart';

class IsAuth extends StatefulWidget {
  @override
  _IsAuthState createState() => _IsAuthState();
}

class _IsAuthState extends State<IsAuth> {
  @override
  Widget build(BuildContext context) {
    return AuthFormWidget();
  }
}
