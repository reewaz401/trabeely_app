import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TourDetails extends StatelessWidget {
  final List mainList;
  int mainListIndex;
  List detail;
  TourDetails({this.mainListIndex, this.mainList});

  @override
  Widget build(BuildContext context) {
    detail = this.mainList;
    mainListIndex = this.mainListIndex;
    print(mainListIndex);

    final splitTime = DateFormat.yMMMd('en_US')
        .format(
          DateTime.parse(detail[mainListIndex]['startDate']),
        )
        .split(' ');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: double.infinity,
                              margin: EdgeInsets.all(5),
                              child: Image.asset(
                                'assets/images/anna1.jpeg',
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: double.infinity,
                              child: Image.asset(
                                'assets/images/anna2.jpeg',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset('assets/images/anna3.jpeg'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  detail[mainListIndex]['title'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.orange[300]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Date',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          width: 90,
                          child: Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                        ),
                        Text(
                          splitTime[1],
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(splitTime[0] + ' ' + splitTime[2])
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue[300]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Time',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          width: 90,
                          child: Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            '15:30',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red[300]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Duration',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          width: 90,
                          child: Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                        ),
                        Text(
                          '13',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Days',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  )
                ],
              ),
              /*Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.pink[900]),
                child: Text(
                  'Rs 25000 per person ',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),*/
              Divider(),
              Container(
                margin: EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  'Type : ' + detail[mainListIndex]['packageType'],
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Staring from:',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Rs ' + detail[mainListIndex]['price'].toString() + '/-',
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  'Includes',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: Container(
                  height: 30,
                  margin: EdgeInsets.all(5),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: detail[mainListIndex]['includes'].length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(8.0),
                                color: Colors.blue.shade200,
                                child: Text(
                                    detail[mainListIndex]['includes'][index])),
                            SizedBox(
                              width: 2,
                            ),
                          ],
                        );
                      }),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  'Itinerary',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // Container(
              //   height: 200,
              //   margin: EdgeInsets.all(5),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: ListView.builder(
              //         itemCount: detail[mainListIndex]['itinerary'].length,
              //         itemBuilder: (context, index) {
              //           return Text(detail[index]['itinerary']);
              //         }),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  'Things recommended to bring : ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(' - Trekking shoes , Dam boots, Sturdy shoes'),
                    Text(' - Comfortable yet sturdy pants.'),
                    Text(' - Rain jacket, Warm jacket'),
                    Text(' - Mulfers'),
                    Text(' - A brimmed hat')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  'Cancellation Policies : ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(detail[mainListIndex]['cancelPolicy']),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
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
                        print(splitTime[1]);
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

  // Widget itenary() {
  //   return ListView.builder(
  //       itemCount: detail[mainListIndex]['itinerary'].length,
  //       itemBuilder: (context, index) {
  //         return Text(detail[index]['itinerary']);
  //       });
  // }
}
