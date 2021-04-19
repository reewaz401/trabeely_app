import 'package:flutter/material.dart';

class HotelDetailsScreen extends StatelessWidget {
  final List<dynamic> mainList;
  int mainListIndex;
  List detail;
  HotelDetailsScreen({this.mainListIndex, this.mainList});
  @override
  Widget build(BuildContext context) {
    print('a ${mainList[mainListIndex]}');
    detail = mainList;
    mainListIndex = mainListIndex;
    var data = mainList[mainListIndex];
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 0.30 * deviceSize.height,
                width: deviceSize.width,
                color: Colors.red,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    data['name'], //  detail[mainListIndex]['hotelName'],
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    height: 40,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange,
                    ),
                    child: Text(
                      '4.5',
                      style: TextStyle(fontSize: 23, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Text(
                "${data['address']}  ${data['country']}",
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(
                height: 10,
              ),
              Text(data['hotelDesc']),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Text(
                'Amenities',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              //Text(data[]),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Text(
                'Room',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Text(
                'Policies',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Text(
                'Cancellation Policiess',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(
                height: 5,
              ),
              Text(data['cancelPolicy']),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 0.4 * MediaQuery.of(context).size.width,
                    child: FlatButton(
                        child: Text(
                          'Reserve',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        color: Colors.blue[900],
                        onPressed: () {}),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 0.4 * MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                        'Book',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      color: Colors.blue[900],
                      onPressed: () {
                        Navigator.pushNamed(context, '/bookinginfo');
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
