import 'package:flutter/material.dart';
import 'addPeopleRoom_widget.dart';
import '../components/datePicker_widget.dart';

class FilterBox {
  var destination = '';
  Widget tourFilter(
      BuildContext context, TextEditingController _tourDestination) {
    return Column(
      children: [
        Container(
            height: 50,
            width: 0.9 * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              controller: _tourDestination,
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
                  hintStyle: TextStyle(color: Colors.black)),
            )),
        Padding(
          padding: const EdgeInsets.only(
            left: 13,
            right: 13,
            top: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /* Container(
                child: datePicker(),
                width: 0.5 * MediaQuery.of(context).size.width,
              ),*/
              Spacer(
                flex: 2,
              ),
              SizedBox(
                child: Text('Number of People'),
                width: 65,
              ),
              Spacer(
                flex: 1,
              ),
              //numberOfPeople()
            ],
          ),
        ),
      ],
    );
  }

  Widget hotelFilter(BuildContext context) {
    var adultsNum = 1;
    var childNum = 0;
    var roomsNum = 1;
    return Column(
      children: [
        Container(
            height: 50,
            width: 0.9 * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5)),
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
                  hintStyle: TextStyle(color: Colors.black)),
            )),
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
