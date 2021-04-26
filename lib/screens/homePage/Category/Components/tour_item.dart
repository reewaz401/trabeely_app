import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'DetailsScreen/tourPackDetails_screen.dart';

class TourItem extends StatelessWidget {
  final String agencyName;
  final String title;
  final String destination;
  final double price;
  final List includes;
  final String date;
  final List mainList;
  final String overview;
  final List image;
  final int index;

  TourItem(
      {this.includes,
      this.index,
      this.image,
      this.agencyName,
      this.title,
      this.destination,
      this.price,
      this.date,
      this.overview,
      this.mainList});

  @override
  Widget build(BuildContext context) {
    print(mainList[index]['user']['companyName']);
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
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
                    title,
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
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 170,
                child: Text(
                  'Seller : ${mainList[index]['user']['companyName']}',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.purple[900],
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TourDetails(
                              mainList: mainList,
                              mainListIndex: index,
                            ))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
