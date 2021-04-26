import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel/screens/FirstScreen/login_screen.dart';
import 'package:travel/screens/FirstScreen/signup_screen.dart';
import 'package:travel/screens/tabsScreen/tabs_screen.dart';

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/logo.svg',
              ),
              Container(
                child: Column(
                  children: [
                    button(
                      context,
                      'Log In',
                      900,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    button(
                      context,
                      'Sign Up',
                      700,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      TabsScreen('Search Destination')));
                        },
                        child: Text(
                          'Explore the App',
                        ))
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget button(
    BuildContext context,
    String buttonName,
    int colVal,
  ) {
    return Container(
      width: 0.7 * MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
        onPressed: () {
          if (buttonName == 'Log In') {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => LoginScreen()));
          } else {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => SignUpScreen()));
          }
        },
        child: Text(
          buttonName,
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue[colVal]),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ))),
      ),
    );
  }
}
