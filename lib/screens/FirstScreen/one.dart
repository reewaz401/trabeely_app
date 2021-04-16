import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel/screens/FirstScreen/login_screen.dart';

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
                      800,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    button(
                      context,
                      'Sign Up',
                      200,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Explore the App',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
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
            return Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => LoginScreen()));
          } else {
            return null;
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
