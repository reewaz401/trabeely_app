import 'package:flutter/material.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/rangeSliderCustom.dart';
import 'package:travel/components/datePicker_widget.dart';
import 'package:travel/components/addPeopleRoom_widget.dart';

class HotelsAdvanceFilter extends StatefulWidget {
  @override
  _HotelsAdvanceFilterState createState() => _HotelsAdvanceFilterState();
}

class _HotelsAdvanceFilterState extends State<HotelsAdvanceFilter> {
  Map<String, bool> values = {
    'Wifi': false,
    'Free Parking': false,
    'Breakfast': true,
    'Balcony': true,
  };
  var adultsNum = 1;
  var childNum = 0;
  var roomsNum = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            child: Text('Apply'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Container(
        height: 500,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Divider(),
            checkThings(),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                left: 13,
                right: 13,
                top: 5,
              ),
              child: Row(
                children: [
                  Flexible(flex: 1, child: DatePickerWidget('from')),
                  VerticalDivider(),
                  Flexible(flex: 1, child: DatePickerWidget('to')),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (bctx) {
                      return AddRoomPeople();
                    });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 50,
                width: 0.9 * MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Text('Adults  '),
                    Text(adultsNum.toString() + " ,"),
                    Text(' Child '),
                    Text(childNum.toString() + ' ,'),
                    Text(' Rooms '),
                    Text(roomsNum.toString())
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            priceRange(),
          ],
        ),
      ),
    );
  }

  Widget priceRange() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Price Range"),
          RangeSliderCustom(),
        ],
      ),
    );
  }

  Widget checkThings() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 100,
            child: GridView.count(
              childAspectRatio: (150 / 40),
              crossAxisCount: 2,
              children: values.keys.map((String key) {
                return new CheckboxListTile(
                  title: new Text(key),
                  value: values[key],
                  onChanged: (bool value) {
                    setState(() {
                      values[key] = value;
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
