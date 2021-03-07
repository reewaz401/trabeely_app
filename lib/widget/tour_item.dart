import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../screens/tourPackDetails_screen.dart';

class TourItem extends StatelessWidget {
  final String agencyName;
  final String location;
  final double price;
  final String time;
  final String date;

  TourItem({
    this.agencyName,
    this.location,
    this.price,
    this.time,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => TrekDetailsScreen())),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 170,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: SvgPicture.asset(
                              'assets/images/airlogo.svg',
                            ),
                          ),
                          Flexible(
                            flex: 5,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Text(
                                    agencyName,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Time'),
                                        Text(
                                          DateFormat.Hm()
                                              .format(DateTime.parse(date)),
                                          style: TextStyle(fontSize: 23),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Days'),
                                        Text('13',
                                            style: TextStyle(fontSize: 23))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      width: double.infinity,
                      child: RichText(
                        text: TextSpan(children: [
                          WidgetSpan(child: Icon(Icons.directions)),
                          TextSpan(
                              text: '$location',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20))
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(15)),
                        color: Colors.red[300],
                      ),
                      height: 75,
                      child: Column(
                        children: [
                          Text(
                            DateFormat.d().format(DateTime.parse(date)),
                            style: TextStyle(fontSize: 25, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          FittedBox(
                            child: Text(
                              DateFormat.yMMM().format(DateTime.parse(date)),
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.euro,
                            color: Colors.green,
                          ),
                          Text(
                            '${price.toString()} ',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//'https://img5.goodfon.com/original/2349x1785/e/fd/devushka-siluet-gory-puteshestviia.jpg'
/*
Flexible(
                      flex: 2,
                      child: 
                    )*/
