import 'package:flutter/material.dart';
import '../../../../../components/datePicker_widget.dart';

class Filter {
  var _numOfCustomer = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var _currentnumOfCustomer = 1;
  var _isloading = true;
  //TourFilter
  var destination = '';
  final _tourDestination = TextEditingController();
  Widget tourFilter(BuildContext context) {
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
              Container(
                child: DatePickerWidget(),
                width: 0.5 * MediaQuery.of(context).size.width,
              ),
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
              numberOfPeople()
            ],
          ),
        ),
      ],
    );
  }
  //HotelFilter

  Widget numberOfPeople() {
    return DropdownButton(
      items: _numOfCustomer.map((int dropDownItem) {
        return DropdownMenuItem(
            value: dropDownItem, child: Text(dropDownItem.toString()));
      }).toList(),
      onChanged: (newValue) {
        this._currentnumOfCustomer = newValue;
      },
      value: _currentnumOfCustomer,
    );
  }
}
