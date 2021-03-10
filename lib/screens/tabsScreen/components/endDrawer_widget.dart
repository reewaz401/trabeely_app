import 'package:flutter/material.dart';

class EndDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.settings,
        color: Color(0xFF245AA0),
      ),
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
    );
  }
}
