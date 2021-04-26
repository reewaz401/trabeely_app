import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel/screens/FirstScreen/login_screen.dart';
import 'package:travel/screens/FirstScreen/signup_screen.dart';

class AskSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        SvgPicture.asset(
          'assets/images/isLogin.svg',
          height: 250,
        ),
        SizedBox(
          height: 30,
        ),
        Card(
          child: Container(
            height: 220,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Oops!',
                  style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                ),
                Text(
                  'It looks like you have not Sign In',
                  style: TextStyle(fontSize: 17, color: Colors.grey[500]),
                ),
                SizedBox(
                  height: 15,
                ),
                button(context, 'Log In', 800),
                SizedBox(
                  height: 5,
                ),
                button(context, 'Sign Up', 400)
              ],
            ),
          ),
        ),
      ],
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
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => SignUpScreen()));
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
