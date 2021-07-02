import 'package:flutter/material.dart';
import 'package:travel/screens/Booking/bookinginfoDisplay.dart';
import 'package:travel/controller/creatbookingFuntion.dart';
import 'package:travel/screens/CreateTour/widgets.dart';
import 'package:travel/widget/alertWidget.dart';

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
                  onPressed: () async {
                    bool success = await createCustomBooking(
                        isinstitution: true,
                        instituionalname: institutionalName.text,
                        instituionalemail: email.text,
                        instituitonContact: phoneNumber.text,
                        institutionalLocation: location.text);
                    bookingAlert(success, context);
                  },
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
