import 'package:flutter/material.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/rangeSliderCustom.dart';

class ToursAdvanceFilter extends StatefulWidget {
  @override
  _ToursAdvanceFilterState createState() => _ToursAdvanceFilterState();
}

class _ToursAdvanceFilterState extends State<ToursAdvanceFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [priceRange()],
          )),
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
}
