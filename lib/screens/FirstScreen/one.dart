import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel/components/button.dart';
import 'package:travel/screens/FirstScreen/login_screen.dart';
import 'package:travel/screens/FirstScreen/signup_screen.dart';
import 'package:travel/screens/tabsScreen/tabs_screen.dart';
import 'package:travel/services/deviceSize.dart';

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 0.23 * deviceSize.height,
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Button(
                        text: 'Login',
                        callback: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => LoginScreen()));
                        }),
                    SizedBox(
                      height: tpaddng * deviceSize.height,
                    ),
                    Button(
                        text: 'Sign Up',
                        backgroundColor: Colors.blue[700],
                        callback: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => SignUpScreen()));
                        }),
                    SizedBox(
                      height: tpaddng * deviceSize.height - 5,
                    ),
                    Button(
                      text: 'Explore App',
                      isDecoration: false,
                      textColor: Colors.black,
                      callback: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) =>
                                TabsScreen('Search Destination')));
                      },
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
