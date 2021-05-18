import 'package:flutter/material.dart';
import 'package:travel/screens/CreateTour/createTour.dart';

class CreateTourCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Icon(
          Icons.add,
          color: Colors.blue,
        ),
        title: Text(
          'Want to create your own ?',
          style: TextStyle(color: Colors.blue),
        ),
        onTap: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => CreateTour())),
      ),
    );
  }
}
