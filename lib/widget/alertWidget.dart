import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/screens/tabsScreen/tabs_screen.dart';

Widget bookingAlert(bool status, context) {
  CoolAlert.show(
    onConfirmBtnTap: () {
      print('Pushed');
      status
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TabsScreen('Search Destination');
                },
              ),
            )
          : Navigator.pop(context);
    },
    context: context,
    barrierDismissible: false,
    type: status ? CoolAlertType.success : CoolAlertType.error,
    text: status ? "Transaction completed successfully!" : "Try Again",
  );
}
