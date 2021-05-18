import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel/components/SizeConfig.dart';
import 'package:travel/components/button.dart';

// ignore: must_be_immutable
class TourDetails extends StatelessWidget {
  final List mainList;
  int mainListIndex;
  List detail;
  TourDetails({this.mainListIndex, this.mainList});

  @override
  Widget build(BuildContext context) {
    print('$mainListIndex' + 'Tjos os adsad');
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
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizeConfig.khstoryImage,
                width: double.infinity,
                color: Colors.white,
                child: detail[0]['packageImg'].length == 2
                    ? Column(
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
                                    child: Image.network(
                                        'https://api.trabeely.com/uploads/package/temp%20(12)_1615989790943.jpg'),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    height: double.infinity,
                                    child: Image.network(
                                      'https://api.trabeely.com/uploads/package/temp%20(12)_1615989790943.jpg',
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
                      )
                    : Column(
                        children: [
                          Flexible(
                            child: Image.network(
                                'https://api.trabeely.com/uploads/package/${detail[mainListIndex]['packageImg'][0]}'),
                          )
                        ],
                      ),
              ),
              SizedBox(
                height: SizeConfig.khspace + 5,
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
                height: SizeConfig.khspace + 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 0.13 * SizeConfig.screenHeight,
                    width: 0.13 * SizeConfig.screenHeight,
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
                        Divider(
                          color: Colors.white,
                          thickness: 2,
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
                  // Container(
                  //   height: 100,
                  //   width: 100,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(5),
                  //       color: Colors.blue[300]),
                  //   child: Column(
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 8),
                  //         child: Text(
                  //           'Time',
                  //           style: TextStyle(fontSize: 18),
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 90,
                  //         child: Divider(
                  //           color: Colors.white,
                  //           thickness: 2,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.all(15.0),
                  //         child: Text(
                  //           '15:30',
                  //           style: TextStyle(fontSize: 20),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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

              SizedBox(
                height: SizeConfig.khspace,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Container(
                //  margin: EdgeInsets.only(left: 15, bottom: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Type : ' + detail[mainListIndex]['packageType'],
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      //margin: EdgeInsets.only(left: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Staring from:',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text(
                            'Rs ' +
                                detail[mainListIndex]['price'].toString() +
                                '/-',
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Container(
                // margin: EdgeInsets.only(left: 15),
                child: Text('Includes',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),

              detail[mainListIndex]['itinerary'].length != 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          //  margin: EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            'Itinerary',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        // Container(
                        //   height: 200,
                        //   margin: EdgeInsets.all(5),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: ListView.builder(
                        //         itemCount:
                        //             detail[mainListIndex]['itinerary'].length,
                        //         itemBuilder: (context, index) {
                        //           final info =
                        //               detail[mainListIndex]['itinerary'];
                        //           return Text(
                        //               'Day ${info[index]['day']} ${info[index]['routeDesc']}');
                        //         }),
                        //   ),
                        // )
                      ],
                    )
                  : Container(),
              Container(
                //  margin: EdgeInsets.only(left: 10, top: 20),
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
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Container(
                // margin: EdgeInsets.only(left: 10, top: 20),
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
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              // Container(
              //   margin: EdgeInsets.all(5),
              //   padding: EdgeInsets.all(5),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Row(
              //         children: [Text('Review : '), Text('5')],
              //       )
              //     ],
              //   ),
              // ),
              Divider(
                color: Colors.grey,
              ),
              Center(
                child: Button(
                  text: 'Book',
                  callback: () {
                    Navigator.pushNamed(context, '/bookinginfo');
                  },
                ),
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
