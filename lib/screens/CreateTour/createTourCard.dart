import 'package:flutter/material.dart';
import 'package:travel/screens/CreateTour/createTour.dart';

class CreateTourCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          child: ListTile(
            leading: Icon(
              Icons.add,
              color: Colors.green,
              size: 70,
            ),
            title: Text(
              ' Create your own ',
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 15,
              ),
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => CreateTour()),
            ),
          ),
        ));
  }
}
