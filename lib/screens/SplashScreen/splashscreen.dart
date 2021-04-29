import 'dart:async';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel/screens/FirstScreen/one.dart';
import 'package:travel/screens/tabsScreen/tabs_screen.dart';
import 'package:travel/screens/Onboarding/Slider.dart';
import 'package:travel/services/authentication.dart';
import 'package:travel/services/deviceSize.dart';
import '../auth_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool onboardingPage;
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

  onboardingPageDisplay() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool display = preferences.getBool('onboardingpageDisplay');
    if (display == true) return true;
    if (display == false) return false;
    if (display == null) return false;
  }

  @override
  void initState() {
    super.initState();
    autoSignIn();
    onboardingPageDisplay().then((value) {
      onboardingPage = value;
    });
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Consumer<Auth>(builder: (context, auth, _) {
              return onboardingPage
                  ? auth.isAuth
                      ? TabsScreen('Search Destination')
                      : OneScreen()
                  : OnboardinPage();
            });
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
                          height: 100,
                        ),
                      ).shimmer(
                          count: 1,
                          showAnimation: true,
                          primaryColor: Colors.blue[900],
                          secondaryColor: Colors.orange),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
