import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/components/datePicker_widget.dart';
import 'package:travel/components/searchBox.dart';
import 'package:travel/components/searchButton.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/FilterData.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/rangeSliderCustom.dart';
//import 'package:travel/screens/homePage/Category/Components/FilterWidget/filterIcon_widget.dart';
import 'package:travel/screens/storyFeedScreen/components/storyFeed_item.dart';

class TourFilter extends StatelessWidget {
  var _numOfCustomer = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var _currentnumOfCustomer = 1;
  var selectedRange = RangeValues(0.2, 0.8);
  final GlobalKey<FormState> _formDestination = GlobalKey();
  final _tourDestination = TextEditingController();
  List<int> priceRange = [];
  @override
  Widget build(BuildContext context) {
    var destination = '';

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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.blue[900])),
                  child: Form(
                    key: _formDestination,
                    child: TextFormField(
                      controller: _tourDestination,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 25, bottom: 11, top: 11, right: 15),
                          hintText: "Enter Destination",
                          hintStyle: TextStyle(color: Colors.blue[900])),
                      onSaved: (value) {
                        FilterData().setDestination(value);
                      },
                    ),
                  )),
              IconButton(
                  icon: Icon(Icons.file_copy),
                  onPressed: () {
                    alertBox(context: context, title: 'Advance Filter');
                  })
            ],
          ),
          SizedBox(
            height: 10,
          ),
          button(context),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

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

  Widget button(BuildContext context) {
    var provider = Provider.of<InitialSetPrice>(context);
    return Container(
      child: TextButton(
        child: Text('Search'),
        onPressed: () async {
          Provider.of<FilterData>(context, listen: false)
              .setDestination(_tourDestination.text);
          Provider.of<FilterData>(context, listen: false)
              .setPrice(provider.iniStart, provider.iniEnd);
        },
      ),
    );
  }

  Future<void> alertBox({BuildContext context, String title}) async {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              children: [
                Container(
                  width: 0.8 * MediaQuery.of(context).size.width,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Price Range",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          RangeSliderCustom(),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Apply'))
              ],
            ),
          );
        });
  }
}
