import 'package:flutter/material.dart';

showBookingDialogue(context) async {
  return await showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: Text('Booking Summary'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              doubleRowText(context, 'Institutional', 'False'),
              doubleRowText(context, 'Institutional Name', 'Trabeely'),
              doubleRowText(context, 'Destination From', 'Kathmandu'),
              doubleRowText(context, 'Destination To', 'Pokhara'),
              doubleRowText(context, 'Starting Date', '3 March, 2021'),
              doubleRowText(context, 'Ending Date', '3 March, 2021'),
              doubleRowText(context, 'Vechicle Type', 'Jeep, Bus'),
              doubleRowText(context, 'Vehicle Route', 'One Way'),
              doubleRowText(context, 'Additional Info',
                  'I want a hotel with wifi. I also want to travel to Chitwan and other plaves '),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () {}, child: Text('Confrim')),
          TextButton(onPressed: () {}, child: Text('Edit'))
        ],
      );
    },
  );
}

Widget doubleRowText(BuildContext context, String heading, String trailing) {
  final width = MediaQuery.of(context).size.width;
  return Column(
    children: [
      Row(
        children: [
          SizedBox(
            width: width * 0.25,
            child: Text(
              heading + ' :',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: width * 0.45,
            child: Text(
              trailing,
              style: TextStyle(color: Colors.grey[800]),
            ),
          )
        ],
      ),
      SizedBox(
        height: 15,
      )
    ],
  );
}
