import 'package:flutter/material.dart';

class CreateTour extends StatefulWidget {
  @override
  _CreateTourState createState() => _CreateTourState();
}

class _CreateTourState extends State<CreateTour> {
  String hotel = '2 Star';
  int destination = 0;
  String transportationway = 'Two Way';

  @override
  Widget build(BuildContext context) {
    Widget deestinationFieldIncreaser() {
      return Column(
        children: [
          Row(children: [
            IconButton(
                icon: Icon(
                  Icons.add_box,
                ),
                onPressed: () {
                  setState(() {
                    destination++;
                  });
                }),
            Text('Add Multiple Destination'),
          ]),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('From '), Text('To')],
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 150,
                        height: 30,
                        child: textfield(),
                      ),
                      Container(
                        width: 150,
                        height: 30,
                        child: textfield(),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: destination,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 125,
                                            height: 30,
                                            child: textfield(),
                                          ),
                                          Container(
                                            width: 125,
                                            height: 30,
                                            child: textfield(),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.minimize_rounded),
                                          onPressed: () {
                                            setState(() {
                                              destination--;
                                            });
                                          })
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          }),
                    ],
                  ),
                ),
                deestinationFieldIncreaser(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('Date From '), Text('Date To')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      height: 30,
                      child: textfield(),
                    ),
                    Container(
                      width: 150,
                      height: 30,
                      child: textfield(),
                    ),
                  ],
                ),
                Text('Number of Travellers'),
                SizedBox(
                  width: 50,
                  child: textfield(),
                ),
                Text('Hotel'),
                RadioListTile(
                    title: Text('2 Star'),
                    value: '2 Star',
                    groupValue: hotel,
                    onChanged: (value) {
                      setState(() {
                        hotel = value;
                      });
                    }),
                RadioListTile(
                    title: Text('3 Star'),
                    value: '3 Star',
                    groupValue: hotel,
                    onChanged: (value) {
                      setState(() {
                        hotel = value;
                      });
                    }),
                RadioListTile(
                    title: Text('4 Star'),
                    value: '4 Star',
                    groupValue: hotel,
                    onChanged: (value) {
                      setState(() {
                        hotel = value;
                      });
                    }),
                RadioListTile(
                  title: Text('5 Star'),
                  value: '5 Star',
                  groupValue: hotel,
                  onChanged: (value) {
                    setState(() {
                      hotel = value;
                    });
                  },
                ),
                Text('Transportaion'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: RadioListTile(
                          title: Text('One Way'),
                          value: 'One Way',
                          groupValue: transportationway,
                          onChanged: (a) {
                            setState(() {
                              transportationway = a;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: RadioListTile(
                          title: Text('Two Way'),
                          value: 'Two Way',
                          groupValue: transportationway,
                          onChanged: (a) {
                            setState(() {
                              transportationway = a;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue[900], primary: Colors.white),
                  onPressed: () {},
                  child: Text('Add Request'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget textfield() {
  return TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );
}
