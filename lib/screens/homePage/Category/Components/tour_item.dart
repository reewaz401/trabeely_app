import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'DetailsScreen/tourPackDetails_screen.dart';

class TourItem extends StatelessWidget {
  final String agencyName;
  final String title;
  final String destination;
  final double price;
  final String date;

  TourItem({
    this.agencyName,
    this.title,
    this.destination,
    this.price,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TourDetails()));
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [imageTile(), detailsTile()],
        ),
      ),
    );
  }

  Widget imageTile() {
    return Flexible(
      flex: 2,
      child: Container(
        margin: EdgeInsets.all(10),
        color: Colors.red,
        height: 170,
      ),
    );
  }

  Widget detailsTile() {
    return Flexible(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'A whole week of glorious mountain view with beatiful scenery under ',
              maxLines: 4,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Date : ',
                        style: TextStyle(color: Colors.grey, fontSize: 10)),
                    TextSpan(
                        text: DateFormat.yMMMd('en_US')
                            .format(DateTime.parse(date))
                            .toString(),
                        style: TextStyle(color: Colors.pink[900]))
                  ]),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Npr : ',
                        style: TextStyle(color: Colors.grey, fontSize: 10)),
                    TextSpan(
                        text: price.toString(),
                        style: TextStyle(color: Colors.green[900]))
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Seller : '),
                IconButton(
                  icon: Icon(Icons.arrow_forward_outlined),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
