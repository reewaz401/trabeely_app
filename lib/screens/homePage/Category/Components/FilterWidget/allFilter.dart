import 'package:flutter/material.dart';
//import 'package:travel/screens/homePage/Category/Components/FilterWidget/filterIcon_widget.dart';

class AllFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 50,
            width: 0.76 * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 0.5)),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Enter Destination",
                  hintStyle: TextStyle(color: Colors.grey)),
            )),
        // FilterIcon('All')
      ],
    );
  }
}
