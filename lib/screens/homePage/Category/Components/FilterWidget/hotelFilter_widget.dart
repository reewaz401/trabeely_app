import 'package:flutter/material.dart';
import 'package:travel/components/datePicker_widget.dart';
import 'package:travel/components/searchBox.dart';
import 'package:travel/components/searchButton.dart';

//import 'package:travel/screens/homePage/Category/Components/FilterWidget/filterIcon_widget.dart';

class HotelFilter extends StatelessWidget {
  var adultsNum = 1;
  var childNum = 0;
  var roomsNum = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 50,
                  width: 0.76 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      //     color: Colors.white,
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
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Enter Destination",
                        hintStyle: TextStyle(color: Colors.grey)),
                  )),
              // FilterIcon('Hotels')
            ],
          ),
          SizedBox(
            height: 10,
          ),
          DatePickerWidget(),
          SizedBox(
            height: 15,
          ),
          SearchButton(),
        ],
      ),
    );
  }
}
