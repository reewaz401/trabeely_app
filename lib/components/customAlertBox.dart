import 'package:flutter/material.dart';

class CustomAlertBox {
  Future<void> alertBox(
      {BuildContext context, String errortitle, String contentMessage}) async {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(errortitle),
            content: Text(contentMessage),
            actions: [
              MaterialButton(
                  child: Text('Ok'),
                  onPressed: () => Navigator.of(context).pop())
            ],
          );
        });
  }
}
