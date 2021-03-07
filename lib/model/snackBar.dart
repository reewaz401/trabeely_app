import 'package:flutter/material.dart';

class CustomSnackBar {
  void customSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      content: Text(message),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
