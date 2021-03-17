import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:travel/screens/tabsScreen/tabs_screen.dart';
import '../widget/signIn_widget.dart';
import '../widget/signUp_widget.dart';

import '../services/authentication.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../animation/animationButton.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import '../model/SignupForm.dart';
import '../model/snackBar.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatefulWidget {
  final bool _isLogin;
  AuthScreen(this._isLogin);
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    //final statusBarSize = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: widget._isLogin
                      ? 0.50 * deviceSize.height
                      : 0.40 * deviceSize.height,
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    alignment: Alignment.center,
                    height: widget._isLogin ? null : 0.2 * deviceSize.height,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: double.infinity,
                    height: widget._isLogin
                        ? 0.50 * deviceSize.height
                        : 0.60 * deviceSize.height,
                    decoration: BoxDecoration(
                      color: Color(0xFF0F367C),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: widget._isLogin ? SignInWidget() : SignUpWidget()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
