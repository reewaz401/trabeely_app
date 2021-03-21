import 'package:flutter/material.dart';
import 'package:travel/components/datePicker_widget.dart';
import 'package:travel/components/addPeopleRoom_widget.dart';
import 'package:travel/screens/homePage/Category/Components/FilterWidget/filterIcon_widget.dart';

class HotelFilter extends StatelessWidget {
  var adultsNum = 1;
  var childNum = 0;
  var roomsNum = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter Destination",
                      hintStyle: TextStyle(color: Colors.grey)),
                )),
            FilterIcon()
          ],
        ),
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
        )
      ],
    );
  }
}
