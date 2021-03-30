import 'package:flutter/material.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/hotelsAdvance.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/toursAdvance.dart';

class FilterIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.sort),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => HotelsAdvanceFilter()));
        },
      ),
    );
  }
}
