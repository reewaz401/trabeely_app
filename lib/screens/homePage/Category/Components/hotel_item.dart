import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:travel/screens/hotelDetails_screen.dart';

class HotelItem extends StatelessWidget {
  final String hotelName;
  //final String title;
  final String destination;
  final double price;
  final List amenities;
  //final String date;
  final List<dynamic> mainList;
  final String overview;
  final List image;
  final int index;

  HotelItem(
      {this.amenities,
      this.index,
      this.image,
      this.hotelName,
      //  this.title,
      this.destination,
      this.price,
      // this.date,
      this.overview,
      this.mainList});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        // color: Colors.blueAccent,
        /// height: 220,
        child: Row(
          children: [
            Flexible(
                flex: 3,
                child:
                    Container(margin: EdgeInsets.all(5), child: imageTile())),
            Flexible(flex: 5, child: detailsTile(context))
          ],
        ));
  }

  Widget imageTile() {
    return /*image[0] != null
        ? Image.network(
            'https://api.trabeely.com/uploads/package/${image[0]}',
            height: 150,
            fit: BoxFit.fill,
            // fit: BoxFit.fill,
          )
        : */
        SvgPicture.asset(
      'assets/images/logo.svg',

      //alignment: Alignment.center,
    );
  }

  Widget detailsTile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    hotelName,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 90,
            child: Text(
              overview,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "starting from",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
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
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.purple[900],
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HotelDetailsScreen(
                              mainList: mainList,
                              mainListIndex: index,
                            ))),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}