import 'package:flutter/material.dart';
import 'package:travel/screens/Booking/bookingSucess.dart';

class BookingInfo extends StatefulWidget {
  @override
  _BookingInfoState createState() => _BookingInfoState();
}

class _BookingInfoState extends State<BookingInfo> {
  var adultsNum = 1;

  var childNum = 0;

  var roomsNum = 1;
  String _paymentMethod = 'Cash';
  @override
  Widget build(BuildContext context) {
    Future<bool> _backPress() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Do You Return Back ?'),
            actions: [
              FlatButton(
                child: Text('Yes'),
                onPressed: () => Navigator.pop(context, true),
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () => Navigator.pop(context, false),
              )
            ],
          );
        },
      );
    }

    return WillPopScope(
      onWillPop: _backPress,
      child: Scaffold(
        bottomSheet: Container(
          width: double.infinity,
          child: RaisedButton(
            color: Colors.blue[900],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingConfirm(
                    adult: adultsNum,
                    child: childNum,
                    room: roomsNum,
                    payment: _paymentMethod,
                  ),
                ),
              );
            },
            child: Text('Book Now'),
          ),
        ),
        appBar: AppBar(
          title: Text('Booking Info'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'Annapurna',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                Text('Enter the number of people'),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.transparent,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (bctx) {
                            return addRoomPeople();
                          });
                    },
                    child: Text(
                        'Adult : $adultsNum Children : $childNum Room : $roomsNum'),
                  ),
                ),
                Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Cash On Hand'),
                      leading: Radio(
                        value: "Cash",
                        groupValue: _paymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _paymentMethod = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('E-Cash'),
                      leading: Radio(
                        value: "E-Cash",
                        groupValue: _paymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _paymentMethod = value;
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addRoomPeople() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter modelSetState) {
      return Container(
        margin: EdgeInsets.all(5),
        height: 0.35 * MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Adults',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    child: Row(
                      children: [
                        FlatButton(
                            child: Icon(
                              Icons.remove,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                modelSetState(() {
                                  adultsNum <= 1 ? adultsNum = 1 : adultsNum--;
                                });
                              });
                            }),
                        Text(
                          adultsNum.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        FlatButton(
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                          onPressed: () => setState(() {
                            modelSetState(() {
                              adultsNum > 15
                                  ? adultsNum = adultsNum
                                  : adultsNum++;
                            });
                          }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Children',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    child: Row(
                      children: [
                        FlatButton(
                          child: Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                          onPressed: () => setState(() {
                            modelSetState(() {
                              childNum <= 0 ? childNum = 0 : childNum--;
                            });
                          }),
                        ),
                        Text(
                          childNum.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        FlatButton(
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                          onPressed: () => setState(() {
                            modelSetState(() {
                              childNum > 5 ? childNum = childNum : childNum++;
                              /*childNum <= -1
                                  ? childNum = 0
                                  : childNum > 5
                                      ? childNum = childNum
                                      : childNum++;*/
                            });
                          }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rooms',
                    style: TextStyle(fontSize: 17),
                  ),
                  Container(
                    child: Row(
                      children: [
                        FlatButton(
                          child: Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                          onPressed: () => setState(() {
                            modelSetState(() {
                              roomsNum <= 1 ? roomsNum = 1 : roomsNum--;
                            });
                          }),
                        ),
                        Text(
                          roomsNum.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        FlatButton(
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                          onPressed: () => setState(() {
                            modelSetState(() {
                              roomsNum > 8 ? roomsNum = roomsNum : roomsNum++;
                            });
                          }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.all(5),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.blue[900],
                child: Text(
                  'Apply',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
