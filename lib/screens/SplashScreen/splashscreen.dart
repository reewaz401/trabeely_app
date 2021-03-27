import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel/screens/tabsScreen/tabs_screen.dart';

import '../auth_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAuto = false;
  void autoSignIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String autoToken = prefs.getString('autoSignIn');
    if (autoToken != null) {
      setState(() {
        isAuto = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    autoSignIn();
    Timer(
      Duration(milliseconds: 5000),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return isAuto ? TabsScreen() : AuthScreen(isAuto);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 50.0,
                        child: SvgPicture.asset(
                          'assets/images/logo.svg',
                          alignment: Alignment.center,
                          height: 50,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
