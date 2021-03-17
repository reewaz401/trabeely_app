import 'package:flutter/material.dart';

class TourDetails extends StatefulWidget {
  @override
  _TourDetailsState createState() => _TourDetailsState();
}

class _TourDetailsState extends State<TourDetails> {
  @override
  Widget build(BuildContext context) {
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
                  'Annapurna Base Camp',
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
                          '2',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Feb, 2021',
                          style: TextStyle(fontSize: 16),
                        )
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
                  'Travel Mountain',
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
                      'Rs 25000 /-',
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    )
                  ],
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
              Container(
                //height: 200,

                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                          'Day 1: Drive to Syauli, trek to Ghandruk - Komrong Danda (2100m), 4-5 hrs walk.'),
                      Text(
                          'Day 2 : Drive to Syauli, trek to Ghandruk - Komrong Danda ](2100m), 4-5 hrs walk.'),
                    ],
                  ),
                ),
              ),
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
                    Text(
                        'In case of cancellation , it must be done before 3 days of destination time '),
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
                      onPressed: () {},
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
