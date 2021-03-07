import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HotelItem extends StatefulWidget {
  @override
  _HotelsWidgetState createState() => _HotelsWidgetState();
}

class _HotelsWidgetState extends State<HotelItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.all(10),
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Flexible(
                  flex: 2,
                  child: Container(
                    child: Image.asset(
                      'assets/images/anna.jpg',
                      fit: BoxFit.fill,
                    ),
                    width: double.infinity,
                    height: 180,
                  )),
              Flexible(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          'Hotel Annapurna',
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          color: Colors.red[100],
                          child: Text('Rating : 4.5'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Location : Lazimpat, Kathmandu'),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Card(
                                    child: Icon(
                                      Icons.local_parking,
                                      size: 15,
                                    ),
                                  )),
                                  TextSpan(
                                    text: 'Parking',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ]),
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Card(
                                    child: Icon(
                                      Icons.breakfast_dining,
                                      size: 15,
                                    ),
                                  )),
                                  TextSpan(
                                    text: 'Break fast',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Extra :'),
                              RichText(
                                text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Card(
                                    child: Icon(
                                      Icons.pool,
                                      size: 15,
                                    ),
                                  )),
                                  TextSpan(
                                    text: 'Swimming',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ]),
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  WidgetSpan(
                                      child: Card(
                                    child: Icon(
                                      Icons.restaurant,
                                      size: 15,
                                    ),
                                  )),
                                  TextSpan(
                                    text: 'Bar',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          )),
    );
  }
}
