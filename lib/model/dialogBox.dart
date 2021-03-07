import 'package:flutter/material.dart';

class DialogBox with ChangeNotifier {
  Future<void> showErrorDialogBox(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('An Error Occured'),
          content: Text(message),
          actions: [
            FlatButton(
                onPressed: () => Navigator.of(ctx).pop(), child: Text('OK'))
          ],
        );
      },
    );
  }
}
