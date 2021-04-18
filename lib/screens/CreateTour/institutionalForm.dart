import 'package:flutter/material.dart';
import 'package:travel/screens/Booking/bookinginfoDisplay.dart';
import 'package:travel/screens/CreateTour/widgets.dart';

class InstitutionalForm extends StatelessWidget {
  TextEditingController institutionalName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              subheading('Institution Name'),
              inputfield(institutionalName, TextInputType.text),
              subheading('Institution Location'),
              inputfield(location, TextInputType.text),
              subheading('Institution Phonenumber'),
              inputfield(phoneNumber, TextInputType.number),
              subheading('Institution Email'),
              inputfield(email, TextInputType.emailAddress),
              Container(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue[900], primary: Colors.white),
                  onPressed: () {},
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
