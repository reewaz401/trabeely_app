import 'package:flutter/material.dart';

Widget BookingInfos(String type, int number) {
  String type;

  int number;

  BookingInfos(type, number);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              type,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.red)),
                    child: IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.exposure_minus_1_sharp),
                        onPressed: () {}),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      number.toString(),
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.green)),
                    child: IconButton(
                      color: Colors.green,
                      icon: Icon(Icons.exposure_plus_1),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
