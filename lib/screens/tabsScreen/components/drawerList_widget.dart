import 'package:flutter/material.dart';

class DrawerListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          child: Text('Settings'),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {},
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {},
        ),
        ListTile(
          title: Text('Item 3'),
          onTap: () {},
        ),
      ],
    );
  }
}
