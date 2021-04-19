import 'package:flutter/material.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/hotelsAdvance.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/toursAdvance.dart';

class FilterIcon extends StatelessWidget {
  final String type;
  FilterIcon(this.type);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.sort),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => type == "Hotels"
                      ? HotelsAdvanceFilter()
                      : ToursAdvanceFilter()));
        },
      ),
    );
  }
}
