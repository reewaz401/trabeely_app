import 'package:flutter/material.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/rangeSliderCustom.dart';

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
            priceRange(),
            Divider(),
            checkThings(),
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
    return Container(
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
    );
  }
}
