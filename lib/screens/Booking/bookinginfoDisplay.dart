import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:travel/components/datePicker_widget.dart';
import 'package:travel/screens/Booking/bookingSucess.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class BookingInfo extends StatefulWidget {
  @override
  _BookingInfoState createState() => _BookingInfoState();
}

class _BookingInfoState extends State<BookingInfo> {
  int adultsNum = 1;
  int childNum = 0;
  String paymentMethod = 'Cash';
  int roomsNum = 1;
  String _paymentMethod = 'Cash';
  void updateChild(int count) {
    setState(() {
      print(childNum);
      childNum = count;
      print(childNum);
    });
  }

  void updateAdult(int count) {
    setState(() => adultsNum = count);
  }

  void updateRoom(int count) {
    setState(() => roomsNum = count);
  }

  @override
  Widget build(BuildContext context) {
    DateTime initDate = DateTime.now();
    DateTime finalDate = DateTime.now();
    String initformattedDate = DateFormat.yMMMd().format(initDate);

    String finalformatDate = DateFormat.yMMMd().format(finalDate);

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Book Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
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
                Text('Annapurna'),
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
                      child: ElevatedButton(
                        onPressed: () {
                          datepicker(context).then((val) {
                            setState(() {
                              finalDate = val;
                            });
                          });
                        },
                        child: Text(initformattedDate),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          datepicker(context).then((val) {
                            setState(() {
                              finalDate = val;
                            });
                          });
                        },
                        child: Text(finalformatDate),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                BookingInfos(
                    type: 'Children', number: childNum, update: updateChild),
                BookingInfos(
                    type: 'Adult', number: adultsNum, update: updateAdult),
                BookingInfos(
                    type: 'Room', number: roomsNum, update: updateRoom),
                SizedBox(
                  height: 15,
                ),
                heading('Your Total Cost'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Rs. 5000 x 2 nights',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Text(
                      'Rs. 10,000',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                heading('Payment Method'),
                RadioListTile(
                    title: Text('Cash'),
                    value: 'Cash',
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value;
                      });
                    }),
                RadioListTile(
                    title: Text('E-Cash'),
                    value: 'E-Cash',
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value;
                      });
                    }),
                heading('Cancelation Policy'),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('''This hotel offers cancellation policy of 
before 1 day of check in.'''),
                )
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

datepicker(context) {
  showDatePicker(
    confirmText: 'Pick',
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2025),
  );
}

Widget heading(String heading) {
  return Column(
    children: [
      SizedBox(
        height: 15,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            heading,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    ],
  );
}

class BookingInfos extends StatelessWidget {
  final ValueChanged<int> update;
  String type;
  int number;
  BookingInfos({this.type, this.number, this.update});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              type,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.red)),
                    child: IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.exposure_minus_1_sharp),
                        onPressed: () {
                          update(-1);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      number.toString(),
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.green)),
                    child: IconButton(
                      color: Colors.green,
                      icon: Icon(Icons.exposure_plus_1),
                      onPressed: () {
                        update(1);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
