import 'package:flutter/material.dart';
class AddRoomPeople extends StatefulWidget {
  @override
  _AddRoomPeopleState createState() => _AddRoomPeopleState();
}

class _AddRoomPeopleState extends State<AddRoomPeople> {
  @override
  Widget build(BuildContext context) {
      ScaffoldFeatureController _bottomSheet;
  var adultsNum = 1;
  var childNum = 0;
  var roomsNum = 1;
    return Container(
      child: StatefulBuilder(
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
                onPressed: () {},
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
    }),
    );
  }
}