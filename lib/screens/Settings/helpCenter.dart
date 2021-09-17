import 'package:flutter/material.dart';
import 'package:travel/screens/CreateTour/widgets.dart';

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            headingText('Contact Us'),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('trabeely@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('986068033'),
            )
          ],
        ),
      ),
    );
  }
}
