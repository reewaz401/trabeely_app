import 'package:flutter/material.dart';
import 'package:travel/services/deviceSize.dart';

class Button extends StatelessWidget {
  final String text;
  final Function callback;
  final Color textColor;
  final int height;
  final int width;
  final Color backgroundColor;
  final bool isDecoration;

  Button(
      {@required this.text,
      this.callback,
      this.backgroundColor,
      this.height,
      this.textColor,
      this.width,
      this.isDecoration = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height == null
          ? kwbutton * MediaQuery.of(context).size.width
          : height,
      height: height == null ? 50 : height,
      child: TextButton(
        onPressed: callback,
        child: Text(
          text,
          style: TextStyle(color: textColor == null ? Colors.white : textColor),
        ),
        style: isDecoration
            ? ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    backgroundColor == null
                        ? Colors.blue[900]
                        : backgroundColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )))
            : null,
      ),
    );
  }
}
