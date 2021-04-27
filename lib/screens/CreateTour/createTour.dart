import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel/screens/CreateTour/widgets.dart';
import 'package:travel/screens/CreateTour/creatbookingFuntion.dart';
import 'package:travel/screens/CreateTour/institutionalForm.dart';
import 'package:travel/widget/alertWidget.dart';

class CreateTour extends StatefulWidget {
  @override
  _CreateTourState createState() => _CreateTourState();
}

class _CreateTourState extends State<CreateTour> {
  String hotel = '2 Star';
  int destination = 0;
  String transportationway = 'Two Way';
  String vehicle = 'Bus';
  bool institutionalBooking = false;
  TextEditingController institutionalName = TextEditingController();
  TextEditingController destinationfromName = TextEditingController();
  TextEditingController destinationToName = TextEditingController();
  TextEditingController additionalInfo = TextEditingController();
  TextEditingController totalPeople = TextEditingController();

  Widget vehicleType(String type) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 250,
          width: 150,
          child: Column(
            children: [
              RadioListTile(
                title: Text(type),
                value: type,
                groupValue: vehicle,
                onChanged: (value) {
                  setState(() {
                    vehicle = value;
                  });
                },
              ),
              Container(
                height: 150,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

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

    DateTime initDate = DateTime.now();
    String initformattedDate = DateFormat.yMMMd().format(initDate);

    DateTime finalDate = DateTime.now();
    String finalformattedDate = DateFormat.yMMMd().format(finalDate);
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Your Booking'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CheckboxListTile(
                    title: Text('Are You An Instution?'),
                    value: institutionalBooking,
                    activeColor: Colors.blue[900],
                    onChanged: (value) {
                      setState(() {
                        institutionalBooking = value;
                      });
                    }),
                institutionalBooking
                    ? InstitutionalForm()
                    : Column(
                        children: [
                          headingText('Destination'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              subheading('From'),
                              subheading(
                                'To',
                              )
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 150,
                                  height: 60,
                                  child: inputfield(
                                      destinationfromName, TextInputType.text),
                                ),
                                Container(
                                  width: 150,
                                  height: 60,
                                  child: inputfield(
                                      destinationToName, TextInputType.text),
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
                                                Container(
                                                  width: 125,
                                                  height: 40,
                                                  child: inputfield(
                                                      destinationfromName,
                                                      TextInputType.text),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 125,
                                                      height: 40,
                                                      child: inputfield(
                                                          destinationToName,
                                                          TextInputType.text),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            destination--;
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 25,
                                                          width: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            border:
                                                                Border.all(),
                                                            color: Colors.red,
                                                          ),
                                                          child: Icon(
                                                            Icons.delete,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
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
                          headingText('Additional Info'),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              subheading('Date From'),
                              subheading('Date To'),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2025),
                                  ).then((value) {
                                    setState(() {
                                      initDate = value;
                                    });
                                  });
                                },
                                child: Text(initformattedDate),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2025),
                                  ).then((value) {
                                    setState(() {
                                      finalDate = value;
                                    });
                                  });
                                },
                                child: Text(finalformattedDate),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              subheading('Total People'),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 80,
                                child: inputfield(
                                    totalPeople, TextInputType.number),
                              ),
                            ],
                          ),
                          headingText('Hotel'),
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
                          RadioListTile(
                              title: Text('Any'),
                              value: 'Any Hotel',
                              groupValue: hotel,
                              onChanged: (value) {
                                setState(() {
                                  hotel = value;
                                });
                              }),
                          headingText('Transportaion'),
                          Row(
                            children: [
                              vehicleType('Self'),
                              vehicleType('Jeep'),
                            ],
                          ),
                          Row(
                            children: [
                              vehicleType('Microbus'),
                              vehicleType('Bus'),
                            ],
                          ),
                          Row(
                            children: [
                              vehicleType('Plane'),
                              vehicleType('Other'),
                            ],
                          ),
                          headingText('Transportaion Way'),
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
                          headingText('Additional Needs'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: TextField(
                                maxLines: 5,
                                decoration: InputDecoration(
                                  hintText:
                                      'Add Your Needs And Prority In This Field',
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
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              width: double.infinity,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue[900],
                                    primary: Colors.white),
                                onPressed: () async {
                                  var status = await createCustomBooking(
                                      hotel: hotel,
                                      destinationfromName: destinationfromName,
                                      destinationToName: destinationToName,
                                      initformattedDate: initformattedDate,
                                      finalformattedDate: finalformattedDate,
                                      totalPeople: totalPeople,
                                      vehicle: vehicle,
                                      transportationway: transportationway,
                                      additionalInfo: additionalInfo,
                                      isinstitution: false);
                                  bookingAlert(status, context);
                                },
                                child: Text('Proceed'),
                              ),
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
}
