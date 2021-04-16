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
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              slideIndex = index;
            });
          },
          children: [SlideTile(slideIndex)],
        ),
      ),
      bottomSheet: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: slideIndex == 2
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [belowButton('Back'), belowButton('Finish')],
                )
              : slideIndex == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [belowButton('Back'), belowButton('Next')],
                    )
                  : belowButton('Next')),
    );
  }

  Widget belowButton(String type) {
    return Container(
      height: 40,
      width: 0.4 * MediaQuery.of(context).size.width,
      child: Center(
          child: TextButton(
        child: Text(
          type,
          style: TextStyle(
              color: type == 'Back' ? Colors.blue[800] : Colors.white),
        ),
        onPressed: () {
          if (type == 'Back') {
            setState(() {
              slideIndex -= 1;
            });
          } else if (type == 'Next') {
            setState(() {
              slideIndex += 1;
            });
          } else {}
        },
      )),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: type == 'Back'
              ? Border.all(width: 1, color: Colors.blue[800])
              : null,
          color: type == 'Back' ? Colors.white : Colors.blue[800]),
    );
  }
}
