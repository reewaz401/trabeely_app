import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:travel/screens/tabsScreen/tabs_screen.dart';

class BookingConfirm extends StatefulWidget {
  final int child;

  final int adult;
  final int room;
  final String payment;
  BookingConfirm({this.adult, this.child, this.room, this.payment});

  @override
  _BookingConfirmState createState() => _BookingConfirmState();
}

class _BookingConfirmState extends State<BookingConfirm> {
  @override
  Widget build(BuildContext context) {
    print(widget.adult);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: FlutterLogo(),
              ),
              doubleRow('Adult', widget.adult.toString()),
              doubleRow('Child', widget.child.toString()),
              doubleRow('Room', widget.room.toString()),
              doubleRow('Price', '500'),
              doubleRow('Payment Method', widget.payment),
              doubleRow(
                  'Total People', (widget.adult + widget.child).toString()),
              doubleRow('Total Price', '250000'),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                onPressed: () {
                  CoolAlert.show(
                    onConfirmBtnTap: () {
                      print('Pushed');
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return TabsScreen();
                        },
                      ));
                    },
                    context: context,
                    barrierDismissible: false,
                    type: CoolAlertType.success,
                    text: "Transaction completed successfully!",
                  );
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget doubleRow(String firstitem, String seconditem) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstitem,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(seconditem),
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
